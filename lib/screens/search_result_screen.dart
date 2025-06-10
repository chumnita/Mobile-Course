import 'package:flutter/material.dart';
import '../widgets/course_card.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  final List<Map<String, String>> allCourses = const [
    {
      'image': 'assets/images/word.png',
      'title': 'Computer Network',
      'description':
          'A network is a system that links computers and devices to share resources and exchange data.',
    },
    {
      'image': 'assets/images/word.png',
      'title': 'Excel Mastery',
      'description': 'Learn to master Excel with formulas, charts, and analysis.',
    },
    {
      'image': 'assets/images/word.png',
      'title': 'Networking Basics',
      'description': 'Understand IP, routing, and the OSI model hands-on.',
    },
    {
      'image': 'assets/images/word.png',
      'title': 'Digital Marketing',
      'description': 'Grow your brand and learn SEO, Ads, and social media.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = allCourses.where((course) {
      final title = course['title']!.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Results for "$query"',
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      backgroundColor: const Color(0xFFFDFDFD),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final course = filtered[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CourseCard(
              image: course['image']!,
              title: course['title']!,
              description: course['description']!,
            ),
          );
        },
      ),
    );
  }
}