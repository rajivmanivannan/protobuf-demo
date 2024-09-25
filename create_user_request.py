from server.generated.user_pb2 import UserRequest

# Create a UserRequest object and populate it
user_request = UserRequest(id="1")

# Serialize to binary format
with open("user_request.bin", "wb") as f:
    f.write(user_request.SerializeToString())
