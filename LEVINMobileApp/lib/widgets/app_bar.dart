import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF13101C),
      title: Image.asset(
        'assets/images/leviiinnn.png',
        height: 60,
        width: 200,
        fit: BoxFit.contain,
      ),
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/images/AiChatbotIcon.png',
            width: 32,
            height: 32,
            color: Colors.white,
          ),
          onPressed: () {
            // Add your chatbot functionality here
            print('AI Chatbot pressed');
          },
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}