import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class MicrobesPage extends StatefulWidget {
  const MicrobesPage({super.key});

  @override
  State<MicrobesPage> createState() => _MicrobesPageState();
}

class _MicrobesPageState extends State<MicrobesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13101C),
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Group 7076.png'),
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
                      'MICROBES',
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
                    // Overview
                    _buildMainCard(
                      icon: Icons.biotech,
                      title: 'What Are Microbes?',
                      items: [
                        'Tiny living organisms (bacteria, fungi)',
                        'Found everywhere in space',
                        'Live on astronauts and spacecraft',
                        'Can survive extreme conditions',
                      ],
                    ),

                    // Why They Matter
                    _buildMainCard(
                      icon: Icons.science,
                      title: 'Why Microbes Matter',
                      items: [
                        'Affect astronaut health',
                        'Can damage spacecraft equipment',
                        'Help recycle waste into nutrients',
                        'Essential for life support systems',
                      ],
                    ),

                    // Behavior Changes
                    _buildMainCard(
                      icon: Icons.change_circle,
                      title: 'How Space Changes Them',
                      items: [
                        'Grow faster in microgravity',
                        'Become more resistant to antibiotics',
                        'Form protective biofilms',
                        'More dangerous than on Earth',
                      ],
                    ),

                    // Spacecraft Microbiome
                    _buildMainCard(
                      icon: Icons.rocket_launch,
                      title: 'Spacecraft Microbiome',
                      items: [
                        'Unique microbial communities',
                        'Different from Earth environments',
                        'Constantly monitored by scientists',
                        'Changes over mission duration',
                      ],
                    ),

                    // Impact on Astronauts
                    _buildMainCard(
                      icon: Icons.person,
                      title: 'Impact on Astronauts',
                      items: [
                        'Weakened immune system',
                        'Higher infection risk',
                        'Skin and gut bacteria changes',
                        'Need careful hygiene protocols',
                      ],
                    ),

                    // Agriculture Impact
                    _buildMainCard(
                      icon: Icons.grass,
                      title: 'Space Agriculture',
                      items: [
                        'Help plants grow in space',
                        'Break down organic waste',
                        'Produce nutrients for crops',
                        'Critical for food production',
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Research Section
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
                                'RESEARCH FOCUS',
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
                          _buildFact('🔬', 'Developing new antibiotics'),
                          _buildFact('🧪', 'Testing probiotic supplements'),
                          _buildFact('🛡️', 'Creating antimicrobial surfaces'),
                          _buildFact('♻️', 'Designing waste recycling systems'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Future Applications
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7F3DB5).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF7F3DB5).withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'FUTURE APPLICATIONS',
                            style: TextStyle(
                              color: Color(0xFFFFD700),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Alegreya SC',
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildApplicationItem(
                            '🏭',
                            'Bio-manufacturing',
                            'Produce medicine in space',
                          ),
                          _buildApplicationItem(
                            '🌱',
                            'Bio-regeneration',
                            'Recycle all waste into resources',
                          ),
                          _buildApplicationItem(
                            '💊',
                            'New medicines',
                            'Discover novel antibiotics',
                          ),
                          _buildApplicationItem(
                            '🔋',
                            'Bio-energy',
                            'Generate power from microbes',
                          ),
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

  Widget _buildApplicationItem(String emoji, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontFamily: 'Alegreya Sans SC',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}