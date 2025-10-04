import 'package:flutter/material.dart';
import '../screens/guide_page.dart';
import '../screens/home_page.dart';
import '../screens/about_page.dart';
import '../screens/verify_content_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF13101C),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF13101C),
            ),
            margin: EdgeInsets.zero,
            child: Image.asset('assets/images/levinn.png', width: 100),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white, size: 32),
            title: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily:'Alegreya SC' )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage(title: '',),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book , color: Colors.white, size: 30,),
            title: const Text('Guides for beginners', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily:'Alegreya SC' )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GuidePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user, color: Colors.white, size: 30,),
            title: const Text('Verify your research', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily:'Alegreya SC' )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VerifyContentPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.white, size: 28,),
            title: const Text('About', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily:'Alegreya SC' )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}