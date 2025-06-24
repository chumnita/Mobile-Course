import 'package:flutter/material.dart';
import '../screens/explore_screen.dart';
import '../screens/search_result_screen.dart';
import '../widgets/header_section.dart';
import '../widgets/course_category_section.dart';
import '../widgets/featured_course_section.dart';
import '../widgets/meet_our_teachers_section.dart';
import '../widgets/quote_section.dart';
import '../widgets/footer_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch(String query) {
    print('🔍 Performing search: $query'); // DEBUG LOG
    final trimmed = query.trim();
    if (trimmed.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SearchResultScreen(query: trimmed)),
      );
    }
  }

  void handleExploreTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ExploreScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔍 Top Bar + Search
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/logo.jpg', height: 28),
                    const Spacer(),
                    const Icon(Icons.search),
                    const SizedBox(width: 12),
                    const Icon(Icons.person_outline),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onSubmitted: _performSearch,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      icon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () => _performSearch(_searchController.text),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              // 🔽 Rest of Home Content
              HeaderSection(onExploreTap: handleExploreTap),
              const CourseCategorySection(),
              const FeaturedCourseSection(),
              const MeetOurTeachersSection(),
              const QuoteSection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
