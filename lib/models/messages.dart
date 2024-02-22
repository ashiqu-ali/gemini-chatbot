import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  final Function onAnimatedTextFinished;

  const Messages({
    Key? key,
    required this.isUser,
    required this.message,
    required this.date,
    required this.onAnimatedTextFinished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? const Color.fromARGB(255, 9, 48, 79) : Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10),
          bottomLeft: isUser ? const Radius.circular(10) : Radius.zero,
          topRight: const Radius.circular(10),
          bottomRight: !isUser ? const Radius.circular(10) : Radius.zero,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(message, textStyle: const TextStyle(color: Colors.black)),
              ],
              totalRepeatCount: 1,
              isRepeatingAnimation: false,
              onFinished: (){
                onAnimatedTextFinished();
              },
            ),
          if (isUser)
            Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          Text(
            date,
            style: TextStyle(color: isUser ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
