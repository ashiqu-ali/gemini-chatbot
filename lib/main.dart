import 'package:flutter/material.dart';
import 'package:gemini_chatbot/pages/chat_screen.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gemini',
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}
