import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class HumanHealthPage extends StatefulWidget {
  const HumanHealthPage({super.key});

  @override
  State<HumanHealthPage> createState() => _HumanHealthPageState();
}

class _HumanHealthPageState extends State<HumanHealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13101C),
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Group 7077.png'),
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
                padding: const EdgeInsets.all(32),
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
                      'HUMAN HEALTH',
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
                    SizedBox(height: 16),
                    Text(
                      'Tap any card to learn more',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'Alegreya Sans SC',
                      ),
                    ),
                  ],
                ),
              ),

              // Body Systems Cards
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildHealthCard(
                      icon: Icons.psychology,
                      color: const Color(0xFFFF6B9D),
                      title: 'Brain & Vision',
                      description: 'Blurry vision and head pressure',
                      details: '• Vision becomes blurry\n• Pressure in the head increases\n• Balance feels different\n• Thinking may slow down\n• Headaches happen often',
                    ),

                    _buildHealthCard(
                      icon: Icons.favorite,
                      color: const Color(0xFFFF5757),
                      title: 'Heart & Blood',
                      description: 'Heart changes shape, blood shifts up',
                      details: '• Heart gets smaller and rounder\n• Blood moves to your head (puffy face)\n• Less blood in total\n• Heart beats irregularly\n• Hard to stand when back on Earth',
                    ),

                    _buildHealthCard(
                      icon: Icons.accessibility,
                      color: const Color(0xFFFFA726),
                      title: 'Bones & Muscles',
                      description: 'Bones weaken, muscles shrink',
                      details: '• Lose 1-2% bone strength each month\n• Muscles get 20% smaller\n• Bones become fragile like osteoporosis\n• Exercise 2.5 hours daily required\n• Takes years to fully recover',
                    ),

                    _buildHealthCard(
                      icon: Icons.restaurant,
                      color: const Color(0xFF66BB6A),
                      title: 'Stomach & Immunity',
                      description: 'Gut bacteria change, weaker immunity',
                      details: '• Gut bacteria are different\n• Easier to get sick\n• Digestion works differently\n• Less appetite\n• Body absorbs nutrients differently',
                    ),

                    _buildHealthCard(
                      icon: Icons.bedtime,
                      color: const Color(0xFF42A5F5),
                      title: 'Sleep & Mood',
                      description: '16 sunrises daily disrupts sleep',
                      details: '• See 16 sunrises and sunsets per day\n• Hard to sleep on schedule\n• Feel isolated and lonely\n• Stress from tight spaces\n• Missing Earth and family',
                    ),

                    _buildHealthCard(
                      icon: Icons.warning_amber,
                      color: const Color(0xFFAB47BC),
                      title: 'Radiation',
                      description: 'Cosmic rays damage cells',
                      details: '• Higher risk of cancer\n• DNA gets damaged\n• Eyes can develop cataracts\n• Skin damage\n• Immune system weakens\n• No perfect protection exists',
                    ),

                    const SizedBox(height: 32),

                    // Fun Facts Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFFD700).withOpacity(0.2),
                            const Color(0xFF7F3DB5).withOpacity(0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFFFD700).withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFD700),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.lightbulb,
                                  color: Color(0xFF13101C),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'DID YOU KNOW?',
                                style: TextStyle(
                                  color: Color(0xFFFFD700),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Alegreya SC',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildFactItem('🚀', 'Astronauts grow 2 inches taller in space!'),
                          _buildFactItem('😢', 'Tears form a ball around your eyes - they don\'t fall!'),
                          _buildFactItem('👃', 'Food tastes bland because your nose gets stuffy'),
                          _buildFactItem('💪', 'Need 2.5 hours of exercise EVERY day'),
                          _buildFactItem('🌅', 'See 16 sunrises and sunsets per day on ISS'),
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

  Widget _buildHealthCard({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required String details,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showDetails(title, details, color),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.3),
                  color.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: color.withOpacity(0.6),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alegreya SC',
                        ),
                      ),
                      const SizedBox(height: 6),
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
                Icon(
                  Icons.arrow_forward_ios,
                  color: color,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFactItem(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.4,
                fontFamily: 'Alegreya Sans SC',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5), width: 2),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              color: color,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
        ],
      ),
    );
  }

  void _showDetails(String title, String details, Color color) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1B2E),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color, width: 3),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  details,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.8,
                    fontFamily: 'Alegreya Sans SC',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Got it!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alegreya SC',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}