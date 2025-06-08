import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/course_category_section.dart';
import '../widgets/featured_course_section.dart';
import '../widgets/meet_our_teachers_section.dart';
import '../widgets/quote_section.dart';
import '../widgets/footer_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderSection(),
            CourseCategorySection(),
            FeaturedCourseSection(),
            MeetOurTeachersSection(),
            QuoteSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
