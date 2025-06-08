import 'package:flutter/material.dart';

class MeetOurTeachersSection extends StatelessWidget {
  const MeetOurTeachersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teacherList = [
      {
        'image': 'assets/images/pro1.png',       
      },
      {
        'image': 'assets/images/pro2.png',
      },
      {
        'image': 'assets/images/pro3.png',
      },
    ];

    return Container(
      color: Colors.deepPurple.shade50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Meet Our Teachers',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2A4A),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              teacherList.length,
              (index) => TeacherCard(
                image: teacherList[index]['image']!,
                name: teacherList[index]['name'] ?? '',
                subject: teacherList[index]['subject'] ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  final String image;
  final String name;
  final String subject;

  const TeacherCard({
    super.key,
    required this.image,
    required this.name,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              height: 150,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          Text(
            subject,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}