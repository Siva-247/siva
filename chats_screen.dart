import 'package:flutter/material.dart';
import 'chat_thread_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = ["Alice", "Bob", "Charlie"];

    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chats[index]),
            subtitle: const Text("Last message..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatThreadScreen(chatName: chats[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
