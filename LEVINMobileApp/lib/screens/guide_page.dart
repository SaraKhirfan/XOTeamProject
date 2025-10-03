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
      body: Column(
        children: [
          // Header with animated gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF7F3DB5).withOpacity(0.5),
                  const Color(0xFFFFD700).withOpacity(0.3),
                  const Color(0xFF7F3DB5).withOpacity(0.5),
                ],
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.menu_book,
                  color: Color(0xFFFFD700),
                  size: 48,
                ),
                const SizedBox(height: 12),
                const Text(
                  'RESEARCH GUIDE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'FOR SPACE BIOLOGY',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Your pathway to understanding space biology research',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontFamily: 'Alegreya Sans SC',
                  ),
                ),
              ],
            ),
          ),

          // Custom Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF7F3DB5).withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color(0xFF7F3DB5).withOpacity(0.4),
                width: 2,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7F3DB5), Color(0xFFFFD700)],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Alegreya SC',
              ),
              tabs: const [
                Tab(text: 'GUIDELINES'),
                Tab(text: 'TOOLS'),
                Tab(text: 'RESOURCES'),
              ],
            ),
          ),

          // Tab Content
          Expanded(
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
    );
  }

  Widget _buildGuidelinesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Getting Started Section
          _buildAdvancedSection(
            title: 'GETTING STARTED',
            icon: Icons.rocket_launch,
            color: const Color(0xFFFFD700),
            children: [
              _buildStepCard(
                step: '1',
                title: 'Build Foundation Knowledge',
                description: 'Start with basic biology concepts before diving into space-specific topics',
                tips: [
                  'Review cell biology fundamentals',
                  'Understand basic genetics',
                  'Learn about human physiology',
                ],
              ),
              _buildStepCard(
                step: '2',
                title: 'Understand Space Environment',
                description: 'Learn how space conditions differ from Earth',
                tips: [
                  'Study microgravity effects',
                  'Learn about radiation types',
                  'Understand life support systems',
                ],
              ),
              _buildStepCard(
                step: '3',
                title: 'Read Review Papers First',
                description: 'Start with overview articles before detailed studies',
                tips: [
                  'Look for "review" or "overview" papers',
                  'Check publication dates (recent preferred)',
                  'Read abstracts to assess relevance',
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Reading Research Papers
          _buildAdvancedSection(
            title: 'HOW TO READ PAPERS',
            icon: Icons.article,
            color: const Color(0xFF7F3DB5),
            children: [
              _buildReadingStrategyCard(
                '📖',
                'Three-Pass Method',
                [
                  'First pass: Read title, abstract, conclusion (5 min)',
                  'Second pass: Read introduction and skim body (15 min)',
                  'Third pass: Deep read with notes (1-2 hours)',
                ],
              ),
              _buildReadingStrategyCard(
                '🔍',
                'Focus on Key Sections',
                [
                  'Abstract: Quick overview of the study',
                  'Introduction: Background and hypothesis',
                  'Methods: How the study was conducted',
                  'Results: What they found',
                  'Discussion: What it means',
                ],
              ),
              _buildReadingStrategyCard(
                '📝',
                'Take Smart Notes',
                [
                  'Highlight unfamiliar terms and look them up',
                  'Summarize each section in your own words',
                  'Note questions that arise while reading',
                  'Track important references for further reading',
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Best Practices
          _buildAdvancedSection(
            title: 'BEST PRACTICES',
            icon: Icons.stars,
            color: const Color(0xFFFFD700),
            children: [
              _buildBestPracticeCard(
                Icons.calendar_today,
                'Set Regular Reading Time',
                'Dedicate 30-60 minutes daily to reading research papers',
              ),
              _buildBestPracticeCard(
                Icons.people,
                'Join Discussion Groups',
                'Engage with communities to discuss and clarify concepts',
              ),
              _buildBestPracticeCard(
                Icons.bookmark,
                'Organize Your Library',
                'Use reference managers to track papers and notes',
              ),
              _buildBestPracticeCard(
                Icons.trending_up,
                'Start Simple, Progress Gradually',
                'Begin with beginner-friendly papers and advance slowly',
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildToolsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Research Databases
          _buildAdvancedSection(
            title: 'RESEARCH DATABASES',
            icon: Icons.storage,
            color: const Color(0xFF7F3DB5),
            children: [
              _buildToolCard(
                '🔬',
                'PubMed',
                'Free database of biomedical and life sciences literature',
                features: [
                  'Over 34 million citations',
                  'Free full-text articles available',
                  'Advanced search filters',
                ],
                url: 'pubmed.ncbi.nlm.nih.gov',
              ),
              _buildToolCard(
                '🚀',
                'NASA Technical Reports',
                'NASA\'s repository of scientific and technical publications',
                features: [
                  'Direct access to NASA research',
                  'Space biology specific content',
                  'Free public access',
                ],
                url: 'ntrs.nasa.gov',
              ),
              _buildToolCard(
                '📚',
                'Google Scholar',
                'Broad search across scholarly literature',
                features: [
                  'Easy to use interface',
                  'Citation tracking',
                  'Related articles suggestions',
                ],
                url: 'scholar.google.com',
              ),
              _buildToolCard(
                '🧬',
                'GeneLab',
                'NASA\'s omics database for spaceflight and analog experiments',
                features: [
                  'Open science data repository',
                  'Gene expression data',
                  'Analysis tools included',
                ],
                url: 'genelab.nasa.gov',
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Reference Management
          _buildAdvancedSection(
            title: 'REFERENCE MANAGERS',
            icon: Icons.folder_special,
            color: const Color(0xFFFFD700),
            children: [
              _buildToolCard(
                '📑',
                'Zotero',
                'Free, open-source reference management tool',
                features: [
                  'Organize papers and PDFs',
                  'Generate citations automatically',
                  'Browser extension available',
                ],
                url: 'zotero.org',
              ),
              _buildToolCard(
                '📖',
                'Mendeley',
                'Reference manager with social networking features',
                features: [
                  'PDF annotation tools',
                  'Collaborate with researchers',
                  'Mobile app available',
                ],
                url: 'mendeley.com',
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Learning Platforms
          _buildAdvancedSection(
            title: 'LEARNING PLATFORMS',
            icon: Icons.school,
            color: const Color(0xFF7F3DB5),
            children: [
              _buildToolCard(
                '🎓',
                'Coursera',
                'Online courses on biology and space science',
                features: [
                  'University-level courses',
                  'Certificates available',
                  'Self-paced learning',
                ],
                url: 'coursera.org',
              ),
              _buildToolCard(
                '📺',
                'Khan Academy',
                'Free educational videos on biology basics',
                features: [
                  'Comprehensive biology curriculum',
                  'Practice exercises',
                  'Completely free',
                ],
                url: 'khanacademy.org',
              ),
              _buildToolCard(
                '🧪',
                'iBiology',
                'Scientific seminars and courses',
                features: [
                  'Expert-led talks',
                  'Research methodology',
                  'Career development',
                ],
                url: 'ibiology.org',
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildResourcesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Key Organizations
          _buildAdvancedSection(
            title: 'KEY ORGANIZATIONS',
            icon: Icons.business,
            color: const Color(0xFFFFD700),
            children: [
              _buildResourceCard(
                '🚀',
                'NASA Space Biology',
                'Leading space biology research program',
                'Funds research, provides data, publishes findings',
                url: 'nasa.gov/biological-physical',
              ),
              _buildResourceCard(
                '🇪🇺',
                'ESA Human Spaceflight',
                'European space research initiatives',
                'International collaboration, research opportunities',
                url: 'esa.int/Science_Exploration',
              ),
              _buildResourceCard(
                '🔬',
                'ISS National Laboratory',
                'Research platform in low Earth orbit',
                'Microgravity experiments, educational programs',
                url: 'issnationallab.org',
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Recommended Journals
          _buildAdvancedSection(
            title: 'RECOMMENDED JOURNALS',
            icon: Icons.library_books,
            color: const Color(0xFF7F3DB5),
            children: [
              _buildJournalCard(
                'npj Microgravity',
                'Open-access journal on microgravity research',
                impact: 'High Impact',
                access: 'Open Access',
              ),
              _buildJournalCard(
                'Astrobiology',
                'Study of life in the universe',
                impact: 'High Impact',
                access: 'Subscription',
              ),
              _buildJournalCard(
                'Life Sciences in Space Research',
                'Space life sciences and astrobiology',
                impact: 'Medium Impact',
                access: 'Subscription',
              ),
              _buildJournalCard(
                'Gravitational and Space Research',
                'Biological and physical sciences in space',
                impact: 'Medium Impact',
                access: 'Open Access',
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Beginner-Friendly Papers
          _buildAdvancedSection(
            title: 'STARTER PAPERS',
            icon: Icons.auto_stories,
            color: const Color(0xFFFFD700),
            children: [
              _buildPaperRecommendation(
                'The Impact of Microgravity on Human Health',
                'Overview of how spaceflight affects the human body',
                difficulty: 'Beginner',
                topics: ['Human Health', 'Microgravity'],
              ),
              _buildPaperRecommendation(
                'Plants in Space: Growth and Development',
                'Review of plant biology in space environments',
                difficulty: 'Beginner',
                topics: ['Plant Biology', 'Agriculture'],
              ),
              _buildPaperRecommendation(
                'Radiation Effects on Living Systems',
                'Introduction to space radiation biology',
                difficulty: 'Intermediate',
                topics: ['Radiation', 'DNA Damage'],
              ),
              _buildPaperRecommendation(
                'Microbial Behavior in Spaceflight',
                'How microbes adapt to space conditions',
                difficulty: 'Beginner',
                topics: ['Microbiology', 'Adaptation'],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Communities
          _buildAdvancedSection(
            title: 'COMMUNITIES & FORUMS',
            icon: Icons.forum,
            color: const Color(0xFF7F3DB5),
            children: [
              _buildCommunityCard(
                Icons.reddit,
                'r/SpaceScience',
                'Reddit community for space science discussions',
                members: '200K+ members',
              ),
              _buildCommunityCard(
                Icons.science,
                'ResearchGate',
                'Network with researchers and ask questions',
                members: '20M+ researchers',
              ),
              _buildCommunityCard(
                Icons.group,
                'Space Biology Interest Groups',
                'Professional societies and student groups',
                members: 'Various communities',
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Advanced Section Builder
  Widget _buildAdvancedSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.15),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.4),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          // Section Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.3),
                  color.withOpacity(0.1),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 24),
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
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Section Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard({
    required String step,
    required String title,
    required String description,
    required List<String> tips,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF7F3DB5).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF7F3DB5).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7F3DB5), Color(0xFFFFD700)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    step,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alegreya SC',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 15,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
          const SizedBox(height: 12),
          ...tips.map((tip) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '• ',
                  style: TextStyle(color: Color(0xFFFFD700), fontSize: 16),
                ),
                Expanded(
                  child: Text(
                    tip,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
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

  Widget _buildReadingStrategyCard(String emoji, String title, List<String> points) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7F3DB5).withOpacity(0.2),
            const Color(0xFF7F3DB5).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFFD700).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...points.map((point) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '→ ',
                  style: TextStyle(color: Color(0xFFFFD700), fontSize: 16),
                ),
                Expanded(
                  child: Text(
                    point,
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

  Widget _buildBestPracticeCard(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFFFD700).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700).withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFFFFD700), size: 24),
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

  Widget _buildToolCard(
      String emoji,
      String name,
      String description, {
        required List<String> features,
        required String url,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF7F3DB5).withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFFFFD700),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                        fontFamily: 'Alegreya Sans SC',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Color(0xFF7F3DB5), size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    feature,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
                      fontFamily: 'Alegreya Sans SC',
                    ),
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF7F3DB5).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              url,
              style: TextStyle(
                color: const Color(0xFFFFD700).withOpacity(0.9),
                fontSize: 12,
                fontFamily: 'Alegreya Sans SC',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(
      String emoji,
      String name,
      String title,
      String description, {
        required String url,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFFD700).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 15,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF7F3DB5).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              url,
              style: TextStyle(
                color: const Color(0xFFFFD700).withOpacity(0.9),
                fontSize: 12,
                fontFamily: 'Alegreya Sans SC',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJournalCard(
      String name,
      String description, {
        required String impact,
        required String access,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7F3DB5).withOpacity(0.15),
            const Color(0xFF7F3DB5).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF7F3DB5).withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  impact,
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF7F3DB5).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  access,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaperRecommendation(
      String title,
      String description, {
        required String difficulty,
        required List<String> topics,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFFFD700).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: difficulty == 'Beginner'
                        ? [const Color(0xFF4CAF50), const Color(0xFF66BB6A)]
                        : [const Color(0xFFFF9800), const Color(0xFFFFB74D)],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  difficulty,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ...topics.map((topic) => Container(
                margin: const EdgeInsets.only(right: 6),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF7F3DB5).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  topic,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 11,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityCard(
      IconData icon,
      String name,
      String description, {
        required String members,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7F3DB5).withOpacity(0.2),
            const Color(0xFF7F3DB5).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF7F3DB5).withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF7F3DB5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 17,
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
                const SizedBox(height: 6),
                Text(
                  members,
                  style: TextStyle(
                    color: const Color(0xFFFFD700).withOpacity(0.9),
                    fontSize: 12,
                    fontFamily: 'Alegreya SC',
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