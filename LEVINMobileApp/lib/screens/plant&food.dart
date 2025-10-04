import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class PlantsFoodPage extends StatefulWidget {
  const PlantsFoodPage({super.key});

  @override
  State<PlantsFoodPage> createState() => _PlantsFoodPageState();
}

class _PlantsFoodPageState extends State<PlantsFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13101C),
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Group 7075.png'),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF7F3DB5).withOpacity(0.4),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      'PLANTS & FOOD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'IN SPACE',
                      style: TextStyle(
                        color: Color(0xFFFFD700),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Why Plants Matter
                    _buildMainCard(
                      icon: Icons.eco,
                      title: 'Why Grow Plants?',
                      items: [
                        'Fresh food for astronauts',
                        'Create oxygen to breathe',
                        'Recycle air and water',
                        'Keep astronauts happy',
                      ],
                    ),

                    // Earth vs Space
                    _buildMainCard(
                      icon: Icons.compare_arrows,
                      title: 'Space vs Earth',
                      items: [
                        'Roots grow everywhere (no gravity)',
                        'Water floats as bubbles',
                        'LED lights replace sun',
                        'Hand pollination needed',
                      ],
                    ),

                    // What We Grow
                    _buildMainCard(
                      icon: Icons.grass,
                      title: 'What We Can Grow',
                      items: [
                        'Lettuce & leafy greens',
                        'Tomatoes & peppers',
                        'Radishes (fast!)',
                        'Wheat & grains',
                      ],
                    ),

                    // Technology
                    _buildMainCard(
                      icon: Icons.science,
                      title: 'Space Farm Tech',
                      items: [
                        'LED grow lights',
                        'Automated watering',
                        'Temperature control',
                        'Remote monitoring',
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Fun Facts
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFFD700).withOpacity(0.2),
                            const Color(0xFF7F3DB5).withOpacity(0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFFFD700),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lightbulb,
                                color: Color(0xFFFFD700),
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'DID YOU KNOW?',
                                style: TextStyle(
                                  color: Color(0xFFFFD700),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Alegreya SC',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildFact('🌸', 'First space flower: Zinnia in 2016'),
                          _buildFact('🥗', 'Astronauts ate space lettuce in 2015'),
                          _buildFact('🚀', 'Mars missions need plant farms'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard({
    required IconData icon,
    required String title,
    required List<String> items,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF7F3DB5).withOpacity(0.3),
            const Color(0xFF7F3DB5).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF7F3DB5).withOpacity(0.6),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF7F3DB5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '• ',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Alegreya Sans SC',
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildFact(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Alegreya Sans SC',
              ),
            ),
          ),
        ],
      ),
    );
  }
}