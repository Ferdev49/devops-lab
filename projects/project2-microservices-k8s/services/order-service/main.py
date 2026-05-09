from flask import Flask, jsonify, request
import os
from datetime import datetime

app = Flask(__name__)

# Simular base de datos
orders_db = {
    1001: {"id": 1001, "user_id": 1, "items": ["item1", "item2"], "total": 99.99, "status": "completed"},
    1002: {"id": 1002, "user_id": 2, "items": ["item3"], "total": 49.99, "status": "pending"}
}

@app.route('/health', methods=['GET'])
def health():
    """Health check"""
    return jsonify({
        "status": "healthy",
        "service": "order-service",
        "timestamp": datetime.utcnow().isoformat()
    }), 200

@app.route('/orders', methods=['GET'])
def get_orders():
    """Get all orders"""
    return jsonify({
        "orders": list(orders_db.values()),
        "count": len(orders_db)
    }), 200

@app.route('/orders/<int:order_id>', methods=['GET'])
def get_order(order_id):
    """Get order by ID"""
    if order_id in orders_db:
        return jsonify(orders_db[order_id]), 200
    return jsonify({"error": "Order not found"}), 404

@app.route('/orders/user/<int:user_id>', methods=['GET'])
def get_user_orders(user_id):
    """Get orders by user ID"""
    user_orders = [order for order in orders_db.values() if order["user_id"] == user_id]
    return jsonify({
        "user_id": user_id,
        "orders": user_orders,
        "count": len(user_orders)
    }), 200

@app.route('/orders', methods=['POST'])
def create_order():
    """Create new order"""
    data = request.get_json()
    new_id = max(orders_db.keys()) + 1 if orders_db else 1001
    new_order = {
        "id": new_id,
        "user_id": data.get("user_id"),
        "items": data.get("items", []),
        "total": data.get("total"),
        "status": "pending"
    }
    orders_db[new_id] = new_order
    return jsonify(new_order), 201

@app.route('/orders/<int:order_id>', methods=['PUT'])
def update_order(order_id):
    """Update order"""
    if order_id not in orders_db:
        return jsonify({"error": "Order not found"}), 404
    
    data = request.get_json()
    orders_db[order_id].update(data)
    return jsonify(orders_db[order_id]), 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5001))
    app.run(host='0.0.0.0', port=port, debug=False)
