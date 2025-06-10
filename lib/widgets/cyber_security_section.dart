import 'package:flutter/material.dart';

class CyberSecuritySection extends StatefulWidget {
  const CyberSecuritySection({super.key});

  @override
  State<CyberSecuritySection> createState() => _CyberSecuritySectionState();
}

class _CyberSecuritySectionState extends State<CyberSecuritySection> {
  int _currentPage = 0;

  final List<Map<String, String>> courses = [
    {'image': 'assets/images/word.png', 'title': 'Microsoft Word'},
    {'image': 'assets/images/word.png', 'title': 'Microsoft Word'},
    {'image': 'assets/images/word.png', 'title': 'Microsoft Word'},
    {'image': 'assets/images/word.png', 'title': 'Microsoft Word'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cyber Security',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E2F4F),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 270,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return _buildCourseCard(course['image']!, course['title']!);
              },
              separatorBuilder: (_, __) => const SizedBox(width: 12),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                courses.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.orange
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(String imagePath, String title) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 50),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 6),
          const Row(
            children: [
              Icon(Icons.school, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text('កំរិតដំបូង', style: TextStyle(fontSize: 11)),
            ],
          ),
          const SizedBox(height: 2),
          const Row(
            children: [
              Icon(Icons.people, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text('99 នាក់បានរៀន', style: TextStyle(fontSize: 11)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/pro.png'),
              ),
              const SizedBox(width: 6),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mr. Bunthorn Liv',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Professor @ITC',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$39.99',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          'Start',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 11),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.arrow_forward, size: 14, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
