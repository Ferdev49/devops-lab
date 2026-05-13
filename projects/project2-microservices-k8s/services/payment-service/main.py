from flask import Flask, jsonify, request
import os
import requests
from datetime import datetime

app = Flask(__name__)

# Simular base de datos
payments_db = {
    "p001": {"id": "p001", "order_id": 1001, "amount": 99.99, "status": "completed", "method": "credit_card"},
    "p002": {"id": "p002", "order_id": 1002, "amount": 49.99, "status": "pending", "method": "paypal"}
}

# Service URLs
ORDER_SERVICE_URL = os.environ.get('ORDER_SERVICE_URL', 'http://order-service:8000')

@app.route('/health', methods=['GET'])
def health():
    """Health check"""
    return jsonify({
        "status": "healthy",
        "service": "payment-service",
        "timestamp": datetime.utcnow().isoformat()
    }), 200

@app.route('/payments', methods=['GET'])
def get_payments():
    """Get all payments"""
    return jsonify({
        "payments": list(payments_db.values()),
        "count": len(payments_db)
    }), 200

@app.route('/payments/<payment_id>', methods=['GET'])
def get_payment(payment_id):
    """Get payment by ID"""
    if payment_id in payments_db:
        return jsonify(payments_db[payment_id]), 200
    return jsonify({"error": "Payment not found"}), 404

@app.route('/payments', methods=['POST'])
def create_payment():
    """Create new payment"""
    data = request.get_json()
    
    # Validate order exists by calling order-service
    try:
        order_response = requests.get(f'{ORDER_SERVICE_URL}/orders/{data.get("order_id")}', timeout=5)
        if order_response.status_code != 200:
            return jsonify({"error": "Order not found"}), 400
        order_data = order_response.json()
    except Exception as e:
        return jsonify({"error": f"Could not verify order: {str(e)}"}), 500
    
    new_id = f"p{len(payments_db) + 1:03d}"
    new_payment = {
        "id": new_id,
        "order_id": data.get("order_id"),
        "amount": data.get("amount") or order_data.get("total"),
        "status": "pending",
        "method": data.get("method", "credit_card")
    }
    payments_db[new_id] = new_payment
    return jsonify(new_payment), 201

@app.route('/payments/<payment_id>/process', methods=['POST'])
def process_payment(payment_id):
    """Process payment and update order status"""
    if payment_id not in payments_db:
        return jsonify({"error": "Payment not found"}), 404
    
    payment = payments_db[payment_id]
    payment["status"] = "completed"
    
    # Update order status in order-service
    try:
        order_update = {"status": "paid"}
        requests.put(
            f'{ORDER_SERVICE_URL}/orders/{payment["order_id"]}',
            json=order_update,
            timeout=5
        )
    except Exception as e:
        # Log but don't fail - payment was successful
        print(f"Warning: Could not update order status: {str(e)}")
    
    return jsonify(payment), 200

@app.route('/payments/order/<int:order_id>', methods=['GET'])
def get_order_payments(order_id):
    """Get all payments for an order"""
    order_payments = [p for p in payments_db.values() if p["order_id"] == order_id]
    
    # Get order info
    try:
        order_response = requests.get(f'{ORDER_SERVICE_URL}/orders/{order_id}', timeout=5)
        order_data = order_response.json() if order_response.status_code == 200 else None
    except Exception as e:
        order_data = None
    
    return jsonify({
        "order_id": order_id,
        "order": order_data,
        "payments": order_payments,
        "count": len(order_payments)
    }), 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5002))
    app.run(host='0.0.0.0', port=port, debug=False)
