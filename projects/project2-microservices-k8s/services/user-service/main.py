from flask import Flask, jsonify, request
import os
from datetime import datetime

app = Flask(__name__)

# Simular base de datos en memoria
users_db = {
    1: {"id": 1, "name": "John Doe", "email": "john@example.com"},
    2: {"id": 2, "name": "Jane Smith", "email": "jane@example.com"}
}

@app.route('/health', methods=['GET'])
def health():
    """Health check endpoint"""
    return jsonify({
        "status": "healthy",
        "service": "user-service",
        "timestamp": datetime.utcnow().isoformat()
    }), 200

@app.route('/users', methods=['GET'])
def get_users():
    """Get all users"""
    return jsonify({
        "users": list(users_db.values()),
        "count": len(users_db)
    }), 200

@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    """Get user by ID"""
    if user_id in users_db:
        return jsonify(users_db[user_id]), 200
    return jsonify({"error": "User not found"}), 404

@app.route('/users', methods=['POST'])
def create_user():
    """Create new user"""
    data = request.get_json()
    new_id = max(users_db.keys()) + 1 if users_db else 1
    new_user = {
        "id": new_id,
        "name": data.get("name"),
        "email": data.get("email")
    }
    users_db[new_id] = new_user
    return jsonify(new_user), 201

@app.route('/users/<int:user_id>', methods=['PUT'])
def update_user(user_id):
    """Update user"""
    if user_id not in users_db:
        return jsonify({"error": "User not found"}), 404
    
    data = request.get_json()
    users_db[user_id].update(data)
    return jsonify(users_db[user_id]), 200

@app.route('/users/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    """Delete user"""
    if user_id not in users_db:
        return jsonify({"error": "User not found"}), 404
    
    del users_db[user_id]
    return jsonify({"message": "User deleted"}), 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)
