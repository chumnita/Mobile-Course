import 'package:flutter/material.dart';

class BestSection extends StatelessWidget {
  const BestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🟧 Title with arrow
        Row(
          children: [
            Image.asset('assets/images/arrow1.png', height: 20),
            const SizedBox(width: 8),
            const Text(
              'Best recommended for you!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // 🟧 Card
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(20),
            width: 330,
            height: 380,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F1F7),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/teach.png',
                    fit: BoxFit.cover,
                    width: 250,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Introduction to Machine Learning',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '“Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),

        // 🟧 Pagination Dots
        const SizedBox(height: 24),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              bool isActive = index == 0;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 4,
                width: 20,
                decoration: BoxDecoration(
                  color: isActive ? Colors.orange : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
