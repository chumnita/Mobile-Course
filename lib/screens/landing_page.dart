import 'package:flutter/material.dart';
import '../screens/explore_screen.dart';
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
  void handleExploreTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ExploreScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(onExploreTap: handleExploreTap),
            const CourseCategorySection(),
            const FeaturedCourseSection(),
            const MeetOurTeachersSection(),
            const QuoteSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
