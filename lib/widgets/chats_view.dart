import 'package:flutter/material.dart';
import 'package:ui_whatsapp/models/chats.dart';
import 'package:ui_whatsapp/theme.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(chat.image),
            radius: 25,
            onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 30),
          ),
          title: Text(chat.name, style: customTextStyle),
          subtitle: Text(
            chat.mostRecentMessage,
            style: const TextStyle(color: Colors.black45, fontSize: 16),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text(
              chat.messageDate,
              style: const TextStyle(color: Colors.black45),
            ),
          ),
        );
      },
    );
  }
}
