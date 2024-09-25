import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:protobuf_demo_flutter_client/generated/user.pb.dart'; // Import the generated protobuf code

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Protobuf Demo'),
        ),
        body: const UserScreen(),
      ),
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String _responseMessage = '';

  Future<void> fetchUser(String userId) async {
    // Create a UserRequest object
    UserRequest request = UserRequest()..id = userId;

    // Send POST request with Protobuf encoded data
    // For Android Emulator,10.0.2.2 IP address maps to 127.0.0.1 on your host machine.
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/get_user'),
      headers: {'Content-Type': 'application/x-protobuf'},
      body: request.writeToBuffer(),
    );

    if (response.statusCode == 200) {
      // Decode the Protobuf response
      Uint8List responseBody = response.bodyBytes;
      UserResponse userResponse = UserResponse.fromBuffer(responseBody);

      setState(() {
        _responseMessage =
        'User: ${userResponse.user.name}, Email: ${userResponse.user.email}';
      });
    } else {
      setState(() {
        _responseMessage = 'Failed to fetch user';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => fetchUser("2"),
            child: const Text('Get User Data'),
          ),
          const SizedBox(height: 20),
          Text(_responseMessage),
        ],
      ),
    );
  }
}