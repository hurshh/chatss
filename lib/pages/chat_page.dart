import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = "Chatscreen";
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chat screen"),
      ),
    );
  }
}
