import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class ResearchGapsPage extends StatelessWidget {
  const ResearchGapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13101C),
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Frame1210.png'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RESEARCH GAPS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alegreya SC',
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Identifying critical areas for future space biology research.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontFamily: 'Alegreya Sans SC',
                ),
              ),
              // Add your research gaps content here
            ],
          ),
        ),
      ),
    );
  }
}