import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/size.dart';
import 'package:gemini_chatbot/utils/style.dart';

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
      padding: const EdgeInsets.all(small),
      margin: const EdgeInsets.symmetric(vertical: small).copyWith(
        left: isUser ? 100 : xsmall,
        right: isUser ? xsmall : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? userChat : resChat,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(xsmall),
          bottomLeft: isUser ? const Radius.circular(xsmall) : Radius.zero,
          topRight: const Radius.circular(xsmall),
          bottomRight: !isUser ? const Radius.circular(xsmall) : Radius.zero,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(message, textStyle: messageText),
              ],
              totalRepeatCount: 1,
              onFinished: () {
                onAnimatedTextFinished();
              },
            ),
          if (isUser)
            Text(
              message,
              style: messageText,
            ),
          Row(
            mainAxisAlignment: isUser ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              Text(
                "\n$date",
                style: dateText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
