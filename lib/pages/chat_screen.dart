import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../models/message.dart';
import '../models/messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userMessage = TextEditingController();
  bool isLoading = false;

  static const apiKey = "APT_KEY";

  final List<Message> _messages = [];

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  void sendMessage() async {
    final message = _userMessage.text;
    _userMessage.clear();

    setState(() {
      _messages.add(Message(
        isUser: true,
        message: message,
        date: DateTime.now(),
      ));
      isLoading = true;
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(
        isUser: false,
        message: response.text ?? "",
        date: DateTime.now(),
      ));
    });
  }

  void onAnimatedTextFinished() {
    setState(() {
      isLoading = false; // Set isLoading to false when animated text is finished
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Messages(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                  onAnimatedTextFinished: onAnimatedTextFinished,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    controller: _userMessage,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        hintText: 'Enter prompt',

                    ),
                  ),
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(15),
                      iconSize: isLoading ? 25 : 30,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            isLoading ? Colors.grey : Colors.black),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      onPressed: () {
                        if (!isLoading) {
                          sendMessage();
                        }
                      },
                      icon: Icon(
                        isLoading ? Icons.square : Icons.arrow_upward,
                      ),
                    ),
                    if (isLoading)
                      const CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
