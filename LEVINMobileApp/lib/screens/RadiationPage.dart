import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class RadiationPage extends StatefulWidget {
  const RadiationPage({super.key});

  @override
  State<RadiationPage> createState() => _RadiationPageState();
}

class _RadiationPageState extends State<RadiationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13101C),
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Group 7074.png'),
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
                      'RADIATION EFFECTS',
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
                    // What is Space Radiation
                    _buildMainCard(
                      icon: Icons.wb_sunny,
                      title: 'What is Space Radiation?',
                      items: [
                        'High-energy particles from space',
                        'More intense than on Earth',
                        'Comes from sun and deep space',
                        'Continuous exposure danger',
                      ],
                    ),

                    // Types of Radiation
                    _buildMainCard(
                      icon: Icons.category,
                      title: 'Types of Radiation',
                      items: [
                        'Cosmic Rays (from deep space)',
                        'Solar Flares (from the sun)',
                        'Van Allen Belts (around Earth)',
                        'Secondary radiation (from shields)',
                      ],
                    ),

                    // Effects on Humans
                    _buildMainCard(
                      icon: Icons.personal_injury,
                      title: 'Effects on Humans',
                      items: [
                        'Increased cancer risk',
                        'Eye damage (cataracts)',
                        'Brain and nerve damage',
                        'Weakened immune system',
                      ],
                    ),

                    // Effects on Plants
                    _buildMainCard(
                      icon: Icons.local_florist,
                      title: 'Effects on Plants',
                      items: [
                        'Stunted growth',
                        'DNA mutations',
                        'Reduced photosynthesis',
                        'Some adapt and survive',
                      ],
                    ),

                    // Protection Methods
                    _buildMainCard(
                      icon: Icons.shield,
                      title: 'Protection Methods',
                      items: [
                        'Thick spacecraft walls',
                        'Water-based shielding',
                        'Magnetic field deflection',
                        'Safe rooms in spacecraft',
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Warning Box
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
                                Icons.warning_amber,
                                color: Color(0xFFFFD700),
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'IMPORTANT',
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
                          _buildFact('☢️', 'No perfect protection exists yet'),
                          _buildFact('🚀', 'Mars missions face higher radiation'),
                          _buildFact('⏰', 'Long exposure = higher risk'),
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