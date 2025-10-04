import 'package:flutter/material.dart';
import 'package:levin/screens/plant&food.dart';
import 'package:levin/screens/verify_content_page.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';
import 'RadiationPage.dart';
import 'cells_molecular_page.dart';
import 'human_health_page.dart';
import 'microbes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

void _performSearch(String query) {
  if (query.isNotEmpty) {
    print('Searching for: $query');
    // Add your search logic here
    // For example:
    // - Filter your data based on the query
    // - Navigate to a search results page
    // - Call an API to search for space biology content
    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) => SearchResultsPage(query: query)
    // ));
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      print('Searching for: $query');
      // Add your search logic here
    }
  }


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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              const Text(
                'WELCOME TO LEVIN,',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Alegreya SC',
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Discover ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: 'How Life Thrives',
                      style: TextStyle(
                        color: Color(0xFFA9D1EA),
                        // Light blue color
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: '\nBeyond ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: 'Earth!',
                      style: TextStyle(
                        color: Color(0xFFFFD700),
                        // Gold color
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Category Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryIcon('assets/images/heartIcon.png', 'Human\nHealth', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HumanHealthPage()),
                    );
                  }),
                  _buildCategoryIcon(
                    'assets/images/plantIcon.png',
                    'Plants &\nFood',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PlantsFoodPage()),
                      );
                    },
                  ),
                  _buildCategoryIcon(
                    'assets/images/MicroIcon.png',
                    'Microbes',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MicrobesPage()),
                      );
                    },
                  ),
                  _buildCategoryIcon('assets/images/RadiationIcon.png', 'Radiation\nEffects', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RadiationPage()),
                    );
                  }),
                  _buildCategoryIcon(
                    'assets/images/CellsIcon.png',
                    'Cells &\nMolecular',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CellsMolecularPage()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 38),

              // Top Picks Section
              const Text(
                'TOP PICKS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alegreya SC',
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'LET\'S EXPLORE BIOLOGICAL INSIGHTS',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontFamily: 'Alegreya Sans SC',
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 24),

              // Feature Cards
              _buildFeatureCard(
                'Verify your research',
                'assets/images/TheTrillionDollarOrbitalEconomy.png',
                // You'll need to add this image
                const Color(0xFF6B46C1),
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                'Guides for beginners',
                'assets/images/TheOverviewEffect.png',
                // You'll need to add this image
                const Color(0xFF6B46C1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String imagePath, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {
        print('$label category tapped');
        // Default action if no onTap provided
      },
      child: Container(
        width: 60,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
            color: const Color(0xFFFFD700), // Yellow stroke
            width: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 32,
              height: 32,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF4C1D95),
                fontSize: 10,
                fontWeight: FontWeight.w600,
                fontFamily: 'Alegreya Sans SC',
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String title, String imagePath, Color buttonColor) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alegreya SC',
                height: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: StatefulBuilder(
                builder: (context, setState) {
                  bool isPressed = false;

                  return GestureDetector(
                    onTapDown: (_) => setState(() => isPressed = true),
                    onTapUp: (_) => setState(() => isPressed = false),
                    onTapCancel: () => setState(() => isPressed = false),
                    onTap: () {
                      print('$title button tapped');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyContentPage()));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      transform: Matrix4.identity()
                        ..scale(isPressed ? 0.9 : 1.0),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        shape: BoxShape.circle,
                        boxShadow: isPressed
                            ? []
                            : [
                          BoxShadow(
                            color: buttonColor.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}