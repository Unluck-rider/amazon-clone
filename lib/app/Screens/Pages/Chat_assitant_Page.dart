import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAssitantPage extends StatefulWidget {
  const ChatAssitantPage({super.key});

  @override
  State<ChatAssitantPage> createState() => _ChatAssitantPageState();
}

class _ChatAssitantPageState extends State<ChatAssitantPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 5",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
