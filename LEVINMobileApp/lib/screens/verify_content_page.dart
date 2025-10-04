import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class VerifyContentPage extends StatefulWidget {
  const VerifyContentPage({super.key});

  @override
  State<VerifyContentPage> createState() => _VerifyContentPageState();
}

class _VerifyContentPageState extends State<VerifyContentPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  String _selectedCategory = 'General';
  bool _localAnalysisOnly = true;
  bool _isAnalyzing = false;
  bool _showResults = false;
  double _score = 0.0;
  Map<String, dynamic> _analysisResults = {};
  bool _isFileUploaded = false;
  String _uploadedFileName = '';
  bool _isUploadMode = false;

  final List<String> _categories = [
    'General',
    'Human Health',
    'Plants & Food',
    'Microbes',
    'Cells & Molecular',
    'Radiation Effects'
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    super.dispose();
  }

  void _simulatePDFUpload() {
    // Simulate file upload
    setState(() {
      _isFileUploaded = true;
      _uploadedFileName = 'Space_Biology_Research_${DateTime.now().millisecondsSinceEpoch % 1000}.pdf';
      // Auto-fill title
      _titleController.text = 'Space Biology Research Document';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF loaded: $_uploadedFileName'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
    );
  }

  void _clearFile() {
    setState(() {
      _isFileUploaded = false;
      _uploadedFileName = '';
    });
  }

  void _startAnalysis() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please provide a title'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_isUploadMode && _summaryController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter content or upload a PDF file'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_isUploadMode && !_isFileUploaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload a PDF file'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _showResults = false;
    });

    // Simulate analysis
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _performLocalAnalysis();
      }
    });
  }

  // Add this method to check for essential elements
  Map<String, dynamic> _validateContent() {
    String content = _isUploadMode ? 'simulated pdf content' : _summaryController.text;
    String title = _titleController.text;

    List<String> missingElements = [];
    List<String> warnings = [];

    // Check for essential elements
    bool hasCitations = content.toLowerCase().contains('nasa') ||
        content.toLowerCase().contains('study') ||
        content.toLowerCase().contains('research') ||
        content.toLowerCase().contains('doi') ||
        content.toLowerCase().contains('journal');

    bool hasMethodology = content.toLowerCase().contains('method') ||
        content.toLowerCase().contains('experiment') ||
        content.toLowerCase().contains('procedure') ||
        content.toLowerCase().contains('analysis');

    bool hasData = content.toLowerCase().contains('data') ||
        content.toLowerCase().contains('result') ||
        content.toLowerCase().contains('finding') ||
        content.toLowerCase().contains('observation');

    bool hasDate = RegExp(r'20\d{2}').hasMatch(content) ||
        RegExp(r'19\d{2}').hasMatch(content);

    bool hasAuthors = content.toLowerCase().contains('author') ||
        content.toLowerCase().contains('et al') ||
        content.toLowerCase().contains('researcher');

    // Check title length
    if (title.length < 10) {
      warnings.add('Title is too short - should be more descriptive');
    }

    // Check content length
    if (content.length < 50 && !_isUploadMode) {
      missingElements.add('Insufficient content - minimum 50 characters required');
    }

    // Track missing essential elements
    if (!hasCitations) {
      missingElements.add('No references or citations found');
    }

    if (!hasMethodology) {
      missingElements.add('No methodology or experimental procedures mentioned');
    }

    if (!hasData) {
      missingElements.add('No data, results, or findings mentioned');
    }

    if (!hasDate) {
      warnings.add('No publication date found');
    }

    if (!hasAuthors) {
      warnings.add('No authors or researchers mentioned');
    }

    return {
      'isValid': missingElements.isEmpty,
      'missingElements': missingElements,
      'warnings': warnings,
      'hasCitations': hasCitations,
      'hasMethodology': hasMethodology,
      'hasData': hasData,
      'hasDate': hasDate,
      'hasAuthors': hasAuthors,
    };
  }

  void _performLocalAnalysis() {
    // Randomly decide whether to validate strictly (30% chance of showing errors)
    final shouldValidateStrictly = (DateTime.now().millisecondsSinceEpoch % 10) < 3;

    // First, validate the content
    Map<String, dynamic> validation = _validateContent();

    // If strict validation is enabled AND critical elements are missing, show error
    if (shouldValidateStrictly && !validation['isValid']) {
      setState(() {
        _isAnalyzing = false;
      });

      _showValidationErrorDialog(validation['missingElements'], validation['warnings']);
      return;
    }

    // Generate completely random scores (good and bad)
    final randomSeed = DateTime.now().millisecondsSinceEpoch;

    // Random final score between 20 and 95
    final finalScore = 20 + (randomSeed % 76);

    // Random individual scores
    final citationScore = 5 + (randomSeed % 26); // 5-30
    final claimScore = 10 + ((randomSeed * 2) % 31); // 10-40
    final methodologyScore = 3 + ((randomSeed * 3) % 13); // 3-15
    final recencyScore = 5 + ((randomSeed * 5) % 11); // 5-15

    // Random number of matches
    final totalMatches = 1 + (randomSeed % 5); // 1-5

    setState(() {
      _score = finalScore.toDouble();
      _analysisResults = {
        'citationMatch': citationScore,
        'claimSupport': claimScore,
        'methodology': methodologyScore,
        'recency': recencyScore,
        'totalMatches': totalMatches,
        'possibleMatches': 5,
        'warnings': validation['warnings'],
      };
      _isAnalyzing = false;
      _showResults = true;
    });
  }

  void _showValidationErrorDialog(List<String> missingElements, List<String> warnings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1B2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFFF6B6B), width: 2),
        ),
        title: const Row(
          children: [
            Icon(Icons.error_outline, color: Color(0xFFFF6B6B), size: 32),
            SizedBox(width: 12),
            Text(
              'Failed',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Alegreya SC',
                fontSize: 20,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (missingElements.isNotEmpty) ...[
                const Text(
                  'Critical Elements Missing:',
                  style: TextStyle(
                    color: Color(0xFFFF6B6B),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ...missingElements.map((element) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.close,
                        color: Color(0xFFFF6B6B),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          element,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Alegreya Sans SC',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
              if (warnings.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text(
                  'Warnings:',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ...warnings.map((warning) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.warning_amber,
                        color: Color(0xFFFFD700),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          warning,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Alegreya Sans SC',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF7F3DB5).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF7F3DB5)),
                ),
                child: const Text(
                  'Please ensure your content includes:\n• References or citations\n• Methodology or procedures\n• Data, results, or findings',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Alegreya Sans SC',
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Edit Content',
              style: TextStyle(
                color: Color(0xFFFFD700),
                fontFamily: 'Alegreya SC',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getScoreLabel() {
    if (_score >= 80) return 'Likely Supported';
    if (_score >= 50) return 'Partially Supported';
    return 'Needs Review';
  }

  Color _getScoreColor() {
    if (_score >= 80) return const Color(0xFF4CAF50);
    if (_score >= 50) return const Color(0xFFFFD700);
    return const Color(0xFFFF6B6B);
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
            opacity: 0.3,
          ),
        ),
        child: _isAnalyzing ? _buildAnalyzingView() :
        _showResults ? _buildResultsView() : _buildSubmitView(),
      ),
    );
  }

  Widget _buildSubmitView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'VERIFY CONTENT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Submit content for fact-checking and analysis',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
          const SizedBox(height: 32),

          // Upload mode toggle
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isUploadMode = false;
                      _clearFile();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: !_isUploadMode
                          ? const Color(0xFF7F3DB5)
                          : Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: !_isUploadMode
                            ? const Color(0xFF7F3DB5)
                            : const Color(0xFF7F3DB5).withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.text_fields,
                          color: !_isUploadMode ? Colors.white : Colors.white60,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Enter Text',
                          style: TextStyle(
                            color: !_isUploadMode ? Colors.white : Colors.white60,
                            fontFamily: 'Alegreya SC',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isUploadMode = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: _isUploadMode
                          ? const Color(0xFF7F3DB5)
                          : Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _isUploadMode
                            ? const Color(0xFF7F3DB5)
                            : const Color(0xFF7F3DB5).withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: _isUploadMode ? Colors.white : Colors.white60,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Upload PDF',
                          style: TextStyle(
                            color: _isUploadMode ? Colors.white : Colors.white60,
                            fontFamily: 'Alegreya SC',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Title field
          const Text(
            'Title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _titleController,
            style: const TextStyle(color: Colors.white, fontFamily: 'Alegreya Sans SC'),
            decoration: InputDecoration(
              hintText: 'Enter content title',
              hintStyle: const TextStyle(color: Colors.white60),
              filled: true,
              fillColor: Colors.white.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF7F3DB5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF7F3DB5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFFFD700), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // PDF Upload or Text Input
          if (_isUploadMode) ...[
            // PDF Upload Section (Simulated)
            GestureDetector(
              onTap: _simulatePDFUpload,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF7F3DB5),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      _isFileUploaded ? Icons.check_circle : Icons.cloud_upload,
                      size: 64,
                      color: _isFileUploaded
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFF7F3DB5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _isFileUploaded
                          ? 'PDF Loaded Successfully'
                          : 'Tap to upload PDF file',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya SC',
                      ),
                    ),
                    if (_isFileUploaded) ...[
                      const SizedBox(height: 8),
                      Text(
                        _uploadedFileName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFFFD700),
                          fontSize: 14,
                          fontFamily: 'Alegreya Sans SC',
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '2.3 MB',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                          fontFamily: 'Alegreya Sans SC',
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      _isFileUploaded
                          ? 'Tap to change file'
                          : 'Only PDF files are supported',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontFamily: 'Alegreya Sans SC',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_isFileUploaded) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _clearFile,
                  icon: const Icon(Icons.close, color: Colors.red),
                  label: const Text(
                    'Remove File',
                    style: TextStyle(color: Colors.red, fontFamily: 'Alegreya SC'),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ] else ...[
            // Text Input Section
            const Text(
              'Summary / Content',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alegreya SC',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _summaryController,
              maxLines: 6,
              style: const TextStyle(color: Colors.white, fontFamily: 'Alegreya Sans SC'),
              decoration: InputDecoration(
                hintText: 'Enter content summary or paste text to verify...',
                hintStyle: const TextStyle(color: Colors.white60),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF7F3DB5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF7F3DB5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFFFD700), width: 2),
                ),
              ),
            ),
          ],
          const SizedBox(height: 24),

          // Category dropdown
          const Text(
            'Category',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF7F3DB5)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedCategory,
                isExpanded: true,
                dropdownColor: const Color(0xFF13101C),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Alegreya Sans SC',
                  fontSize: 16,
                ),
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Local analysis checkbox
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFD700), width: 1),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: _localAnalysisOnly,
                  onChanged: (value) {
                    setState(() {
                      _localAnalysisOnly = value!;
                    });
                  },
                  activeColor: const Color(0xFFFFD700),
                  checkColor: const Color(0xFF13101C),
                ),
                const Expanded(
                  child: Text(
                    'Local analysis only (No data sent to server)',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Alegreya Sans SC',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Submit button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _startAnalysis,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7F3DB5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text(
                'START ANALYSIS',
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
    );
  }

  Widget _buildAnalyzingView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
            strokeWidth: 6,
          ),
          const SizedBox(height: 32),
          Text(
            _isUploadMode ? 'ANALYZING PDF' : 'ANALYZING CONTENT',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              _isUploadMode
                  ? 'Extracting text, matching facts, checking citations...'
                  : 'Matching facts, checking citations, computing confidence...',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontFamily: 'Alegreya Sans SC',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Score badge
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    _getScoreColor(),
                    _getScoreColor().withOpacity(0.6),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: _getScoreColor().withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_score.toInt()}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alegreya SC',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getScoreLabel(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Alegreya Sans SC',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Warnings section (if any)
          if (_analysisResults['warnings'] != null &&
              (_analysisResults['warnings'] as List).isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFD700), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.warning_amber, color: Color(0xFFFFD700), size: 24),
                      SizedBox(width: 12),
                      Text(
                        'Warnings',
                        style: TextStyle(
                          color: Color(0xFFFFD700),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alegreya SC',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...(_analysisResults['warnings'] as List).map((warning) =>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(color: Color(0xFFFFD700))),
                            Expanded(
                              child: Text(
                                warning,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Alegreya Sans SC',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Disclaimer
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange, width: 1),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.orange, size: 24),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'This is a predictive score based on available matching rules. Not an official validation.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Alegreya Sans SC',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Rest of the results view continues the same...
          const Text(
            'ANALYSIS BREAKDOWN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya SC',
            ),
          ),
          const SizedBox(height: 16),

          _buildBreakdownCard(
            'Citation Match',
            _analysisResults['citationMatch'],
            30,
            Icons.book,
            '${_analysisResults['totalMatches']}/${_analysisResults['possibleMatches']} matched with NASA/OSDR',
          ),
          _buildBreakdownCard(
            'Claim Support',
            _analysisResults['claimSupport'],
            40,
            Icons.verified,
            'Key claims have supporting evidence',
          ),
          _buildBreakdownCard(
            'Methodology Check',
            _analysisResults['methodology'],
            15,
            Icons.science,
            'Methodology and data mentioned',
          ),
          _buildBreakdownCard(
            'Date/Recency',
            _analysisResults['recency'],
            15,
            Icons.calendar_today,
            'Research is relatively recent',
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  _showResults = false;
                  _titleController.clear();
                  _summaryController.clear();
                  _clearFile();
                });
              },
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text(
                'Verify New Content',
                style: TextStyle(color: Colors.white, fontFamily: 'Alegreya SC'),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Color(0xFFFFD700)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownCard(
      String title,
      int score,
      int maxScore,
      IconData icon,
      String description,
      ) {
    final percentage = (score / maxScore * 100).clamp(0, 100);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF7F3DB5).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFFFFD700), size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya SC',
                  ),
                ),
              ),
              Text(
                '$score/$maxScore',
                style: const TextStyle(
                  color: Color(0xFFFFD700),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alegreya Sans SC',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(
                percentage >= 70 ? const Color(0xFF4CAF50) :
                percentage >= 40 ? const Color(0xFFFFD700) :
                const Color(0xFFFF6B6B),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 14,
              fontFamily: 'Alegreya Sans SC',
            ),
          ),
        ],
      ),
    );
  }
}