import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13101C),
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Compact Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF7F3DB5).withOpacity(0.4),
                    const Color(0xFFFFD700).withOpacity(0.2),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.menu_book, color: Color(0xFFFFD700), size: 36),
                  const SizedBox(height: 8),
                  const Text(
                    'RESEARCH GUIDE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alegreya SC',
                    ),
                  ),
                ],
              ),
            ),

            // Tab Bar
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF7F3DB5).withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: const Color(0xFF7F3DB5).withOpacity(0.4), width: 2),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF7F3DB5), Color(0xFFFFD700)]),
                  borderRadius: BorderRadius.circular(25),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'Alegreya SC'),
                tabs: const [
                  Tab(text: 'GUIDELINES'),
                  Tab(text: 'TOOLS'),
                  Tab(text: 'RESOURCES'),
                ],
              ),
            ),

            // Tab Content
            SizedBox(
              height: 600,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildGuidelinesTab(),
                  _buildToolsTab(),
                  _buildResourcesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuidelinesTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSimpleCard(
          '🚀 Getting Started',
          [
            'Build foundation knowledge in basic biology',
            'Understand space environment differences',
            'Start with review papers before detailed studies',
          ],
        ),
        _buildSimpleCard(
          '📖 How to Read Papers',
          [
            'Use three-pass method: skim, read, deep dive',
            'Focus on abstract, methods, results, discussion',
            'Take notes and highlight unfamiliar terms',
          ],
        ),
        _buildSimpleCard(
          '⭐ Best Practices',
          [
            'Set regular reading time (30-60 min daily)',
            'Join discussion groups for clarification',
            'Use reference managers to organize papers',
            'Start simple and progress gradually',
          ],
        ),
      ],
    );
  }

  Widget _buildToolsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildToolSimpleCard('🔬 PubMed', 'Free biomedical literature database'),
        _buildToolSimpleCard('🚀 NASA Technical Reports', 'NASA scientific publications'),
        _buildToolSimpleCard('📚 Google Scholar', 'Search scholarly literature'),
        _buildToolSimpleCard('🧬 GeneLab', 'NASA omics database'),
        const SizedBox(height: 16),
        _buildToolSimpleCard('📑 Zotero', 'Reference management tool'),
        _buildToolSimpleCard('📖 Mendeley', 'Reference manager with networking'),
        const SizedBox(height: 16),
        _buildToolSimpleCard('🎓 Coursera', 'Online biology courses'),
        _buildToolSimpleCard('📺 Khan Academy', 'Free biology videos'),
      ],
    );
  }

  Widget _buildResourcesTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSimpleCard(
          '🏢 Key Organizations',
          [
            'NASA Space Biology - Leading research program',
            'ESA Human Spaceflight - European initiatives',
            'ISS National Laboratory - Microgravity research',
          ],
        ),
        _buildSimpleCard(
          '📚 Recommended Journals',
          [
            'npj Microgravity (Open Access)',
            'Astrobiology (High Impact)',
            'Life Sciences in Space Research',
            'Gravitational and Space Research',
          ],
        ),
        _buildSimpleCard(
          '📖 Starter Papers',
          [
            'Impact of Microgravity on Human Health',
            'Plants in Space: Growth & Development',
            'Radiation Effects on Living Systems',
            'Microbial Behavior in Spaceflight',
          ],
        ),
      ],
    );
  }

  Widget _buildSimpleCard(String title, List<String> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7F3DB5).withOpacity(0.15),
            const Color(0xFF7F3DB5).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF7F3DB5).withOpacity(0.4), width: 1.5),
      ),
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
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(color: Color(0xFFFFD700), fontSize: 16)),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
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

  Widget _buildToolSimpleCard(String name, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          Text(name.split(' ')[0], style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.substring(name.indexOf(' ') + 1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 13,
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