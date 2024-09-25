#!/bin/bash

# Compile Protobuf for Python
protoc --proto_path=proto --python_out=server/generated proto/*.proto

# Compile Protobuf for Dart (Flutter client)
protoc --proto_path=proto --dart_out=client/lib/generated proto/*.proto

echo "Protobuf files compiled successfully."