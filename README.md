# Protobuf Demo

## Overview

Protobuf Demo Server is a simple HTTP server implemented in Python that demonstrates the usage of Protocol Buffers (Protobuf) for data serialization. It serves as an example of how to build a server-client architecture using Protobuf without gRPC, focusing on sending and receiving structured data.

## Features

- HTTP server built with Flask
- Data serialization using Protocol Buffers
- Easy-to-understand example of a user data model

## Project Structure
![Project Structure](project_structure.png)

## Prerequisites

- Python 3.x
- pip (Python package manager)
- Flutter (for the client application)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/rajivmanivannan/protobuf-demo.git
   cd protobuf-demo-server
   ```
2. Create a virtual environment:

   ```bash
   python -m venv venv
   ```
3. Activate the virtual environment:

   ```bash
   source venv/bin/activate
   ```
4. Install the dependencies:

   ```bash
   pip install -r requirements.txt
   ```
5. Verify the installation:

   ```bash
   pip freeze
   ```

### Protobuf Code Generation

To generate both Python and Dart files for the .proto definitions:

```sh
bash scripts/generate_protos.sh  
```

## Running the Server Application

To run the Python application:

```sh
python server/server.py 
```

### Serializing the Protobuf Request
To serialize the Protobuf request:

 ```sh
python create_user_request.py
```

### Sending the Request with cURL
Use the following curl command to send the request:

 ```sh
curl -X POST 127.0.0.1:5000/get_user \
     -H "Content-Type: application/x-protobuf" \
     --data-binary @user_request.bin \
     --output user_response.bin
```

### Deserializing the Protobuf Response
To deserialize the Protobuf response:

 ```sh
python deserialize_response.py
```
### Debugging Wire Format (Binary Data)
The Protobuf compiler (protoc) has a --decode & --decode_raw options that lets you decode binary messages back into human-readable form

 ```sh
protoc --decode_raw < binary_data_file  

# Decodes the binary data using the .proto definition
protoc --decode=User proto/user.proto < binary_data.bin
```

## Running the client Application  
Flutter project is under ```/client``` directory. You can open and run the flutter app with your choice of IDE like Android Studio or VSCode etc.,


## License
This project is licensed under the MIT License

## Acknowledgments
Special thanks to the Protocol Buffers team for their excellent work.
Thanks to the Flask community for providing a lightweight web framework.
