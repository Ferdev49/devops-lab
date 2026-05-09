from flask import Flask, jsonify, request
import os
from datetime import datetime

app = Flask(__name__)

# Simular base de datos
payments_db = {
    "p001": {"id": "p001", "order_id": 1001, "amount": 99.99, "status": "completed", "method": "credit_card"},
    "p002": {"id": "p002", "order_id": 1002, "amount": 49.99, "status": "pending", "method": "paypal"}
}

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
    new_id = f"p{len(payments_db) + 1:03d}"
    new_payment = {
        "id": new_id,
        "order_id": data.get("order_id"),
        "amount": data.get("amount"),
        "status": "pending",
        "method": data.get("method", "credit_card")
    }
    payments_db[new_id] = new_payment
    return jsonify(new_payment), 201

@app.route('/payments/<payment_id>/process', methods=['POST'])
def process_payment(payment_id):
    """Process payment"""
    if payment_id not in payments_db:
        return jsonify({"error": "Payment not found"}), 404
    
    payments_db[payment_id]["status"] = "completed"
    return jsonify(payments_db[payment_id]), 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5002))
    app.run(host='0.0.0.0', port=port, debug=False)
