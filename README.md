# Gemini Chat App

Gemini Chat App is a simple Flutter application that demonstrates a chat interface powered by the Gemini Generative AI model. Users can interact by entering prompts, and the app responds with AI-generated content.

## Features

- **Chat Interface:** Users can send prompts in a chat-like interface.
- **Generative AI Model:** Utilizes the Gemini Generative AI model to generate responses to user prompts.

## Getting Started

To run the app locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/ashiqu-ali/gemini-chatbot.git
   ```

2. Install Dependencies

   ```bash
   flutter pub get
   ```

3. Run the app
   ```bash
   flutter run
   ```

# Dependencies
- flutter/material.dart: Flutter framework for building the UI.
- google_generative_ai: Dependency for interacting with the Gemini Generative AI model.
- intl: Internationalization and localization package for formatting dates.

## Configuration

Before running the app, make sure to replace the placeholder API key in `lib/pages/chat_screen.dart` with a valid Gemini Generative AI API key.

1. Visit [Gemini Generative AI](https://ai.google.dev/) and sign up for an account.
2. Obtain your API key from the Gemini Generative AI dashboard.
3. Replace the placeholder API key in `lib/pages/chat_screen.dart` with your actual API key.

```dart
static const apiKey = "YOUR_API_KEY";
```
