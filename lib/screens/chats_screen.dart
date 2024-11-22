import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: Center(
        child: Text(
          'Chats Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}