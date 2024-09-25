from flask import Flask, request, jsonify
from generated.user_pb2 import User, UserRequest, UserResponse

app = Flask(__name__)

# user data
users_db = {
    "1": {"id": "1", "name": "Alice", "age": 24, "email": "alice@example.com"},
    "2": {"id": "2", "name": "Bob", "age": 25, "email": "bob@example.com"}
}


@app.route('/get_user', methods=['POST'])
def get_user():
    # Deserialize the incoming UserRequest protobuf message
    user_request = UserRequest()
    user_request.ParseFromString(request.data)

    user_id = user_request.id
    user_data = users_db.get(user_id)

    if user_data:
        # Create and populate the UserResponse message
        user = User(id=user_data["id"], name=user_data["name"], age=user_data["age"], email=user_data["email"])
        user_response = UserResponse(user=user)

        # Serialize and send the UserResponse message
        return user_response.SerializeToString(), 200, {'Content-Type': 'application/x-protobuf'}
    else:
        return jsonify({"error": "User not found"}), 404


if __name__ == '__main__':
    app.run(port=5000, debug=True)
