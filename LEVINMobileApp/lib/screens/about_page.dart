import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13101C),
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Group 7073.png'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section with Earth Image
              Stack(
                alignment: Alignment.center,
                children: [
                  // Logo overlay
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'ABOUT US',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alegreya SC',
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'MEET THE TEAM BEHIND LEVIN',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontFamily: 'Alegreya Sans SC',
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Logo
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFFD700),
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/levinn.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // About LEVIN Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ABOUT LEVIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 60,
                      height: 3,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFD700), Color(0xFF7F3DB5)],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // LEVIN Logo and Tagline
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/levinn.png',
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'LEVIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Alegreya SC',
                                ),
                              ),
                              Text(
                                'Exploring the Biology of Space',
                                style: TextStyle(
                                  color: Color(0xFFFFD700),
                                  fontSize: 14,
                                  fontFamily: 'Alegreya Sans SC',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Description
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF7F3DB5).withOpacity(0.3),
                        ),
                      ),
                      child: const Text(
                        'LEVIN is named after Gilbert V. Levin, principal investigator of NASA\'s Viking Labeled Release Experiment in 1976, the first mission to detect signs of life on Mars. We honor his legacy and the pioneering spirit of exploring life beyond Earth. LEVIN represents the courage to ask bold questions and the pioneering spirit of exploring life beyond Earth. It\'s here as a space biology knowledge engine to share stories, experiments, and discoveries about life in the universe.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.6,
                          fontFamily: 'Alegreya Sans SC',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Meet Our Team Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MEET OUR TEAM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 60,
                      height: 3,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFD700), Color(0xFF7F3DB5)],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Team Description
                    const Text(
                      'We are XO Team, a group of passionate students and young professionals driven by curiosity, creativity, and the ambition to make an impact. Each member brings unique skills and perspectives, from science and technology to design and problem-solving, united by a shared interest in exploring space biology and creating innovative digital solutions. Together, we collaborate, learn, and grow, turning ideas into meaningful projects that reflect our commitment to discovery and innovation.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.6,
                        fontFamily: 'Alegreya Sans SC',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 32),

                    // Team Members Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.85,
                      children: [
                        _buildTeamMember(
                          'Sara Khirfan',
                          'Team Leader & UI UX Designer',
                          Icons.person,
                        ),
                        _buildTeamMember(
                          'Hashim Shatat',
                          'Developer & AI Specialist',
                          Icons.person,
                        ),
                        _buildTeamMember(
                          'Majd Anas',
                          'Developer & Content Manager',
                          Icons.person,
                        ),
                        _buildTeamMember(
                          'Rama AlSwalmeh',
                          'Data Analyst & Content Manager',
                          Icons.person,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Footer
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  border: Border(
                    top: BorderSide(
                      color: const Color(0xFF7F3DB5).withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/levinn.png',
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '© 2025 LEVIN. All rights reserved.',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontFamily: 'Alegreya Sans SC',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMember(String name, String role, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF7F3DB5).withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF7F3DB5).withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFFD700),
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            role,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
        ],
      ),
    );
  }
}