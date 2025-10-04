import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class CellsMolecularPage extends StatefulWidget {
  const CellsMolecularPage({super.key});

  @override
  State<CellsMolecularPage> createState() => _CellsMolecularPageState();
}

class _CellsMolecularPageState extends State<CellsMolecularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13101C),
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Gro.png'),
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
                      'CELLS & MOLECULAR',
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
                    // Why Study Cells
                    _buildMainCard(
                      icon: Icons.science,
                      title: 'Why Study Cells in Space?',
                      items: [
                        'Understand how life adapts',
                        'Develop new medicines',
                        'Improve astronaut health',
                        'Discover disease treatments',
                      ],
                    ),

                    // Cell Growth Changes
                    _buildMainCard(
                      icon: Icons.bubble_chart,
                      title: 'Cell Growth Changes',
                      items: [
                        'Cells divide differently in microgravity',
                        'Some grow faster, some slower',
                        'Shape and structure altered',
                        'Cell communication changes',
                      ],
                    ),

                    // Gene Expression
                    _buildMainCard(
                      icon: Icons.biotech,
                      title: 'Gene Expression',
                      items: [
                        'Genes turn on/off differently',
                        'Protein production changes',
                        'Molecular pathways affected',
                        'Stress response activated',
                      ],
                    ),

                    // DNA Damage
                    _buildMainCard(
                      icon: Icons.warning_amber,
                      title: 'DNA Damage & Repair',
                      items: [
                        'Cosmic radiation damages DNA',
                        'Cells repair DNA differently',
                        'Increased mutation risk',
                        'Long-term genetic effects',
                      ],
                    ),

                    // Immune Cells
                    _buildMainCard(
                      icon: Icons.shield,
                      title: 'Immune Cell Function',
                      items: [
                        'White blood cells weakened',
                        'Slower immune response',
                        'Inflammation changes',
                        'Higher infection risk',
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Research Applications
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
                                Icons.medical_services,
                                color: Color(0xFFFFD700),
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'MEDICAL APPLICATIONS',
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
                          _buildApplication(
                            '🧬',
                            'Cancer Research',
                            'Study tumor growth in 3D',
                          ),
                          _buildApplication(
                            '💊',
                            'Drug Development',
                            'Test new medicines faster',
                          ),
                          _buildApplication(
                            '🦴',
                            'Tissue Engineering',
                            'Grow organs and tissues',
                          ),
                          _buildApplication(
                            '🧪',
                            'Protein Crystals',
                            'Create better drug structures',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Key Discoveries
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
                            'KEY DISCOVERIES',
                            style: TextStyle(
                              color: Color(0xFFFFD700),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Alegreya SC',
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildDiscovery(
                            '🔬',
                            'Cells age faster in space',
                          ),
                          _buildDiscovery(
                            '🧫',
                            'Bacteria become more dangerous',
                          ),
                          _buildDiscovery(
                            '💉',
                            'Vaccines may work differently',
                          ),
                          _buildDiscovery(
                            '🧬',
                            'Stem cells behave uniquely',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Future Research
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF7F3DB5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.rocket_launch,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'FUTURE RESEARCH',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Alegreya SC',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildFutureItem('Understanding aging mechanisms'),
                          _buildFutureItem('Developing space-specific treatments'),
                          _buildFutureItem('Creating artificial organs'),
                          _buildFutureItem('Improving radiation protection'),
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

  Widget _buildApplication(String emoji, String title, String description) {
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

  Widget _buildDiscovery(String emoji, String text) {
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

  Widget _buildFutureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '→ ',
            style: TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
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