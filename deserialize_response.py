from server.generated.user_pb2 import UserResponse

# Read and parse the response from the binary file
with open("user_response.bin", "rb") as f:
    response_data = f.read()

user_response = UserResponse()
user_response.ParseFromString(response_data)

# Print the user information
print(f"User Id: {user_response.user.id}")
print(f"User Name: {user_response.user.name}")
print(f"User Age: {user_response.user.age}")
print(f"User Email: {user_response.user.email}")
