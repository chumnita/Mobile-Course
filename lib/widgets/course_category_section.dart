import 'package:flutter/material.dart';

class CourseCategorySection extends StatelessWidget {
  const CourseCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F7FF), // Light background
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top icon row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CategoryIcon(title: 'Explore', icon: Icons.explore),
                CategoryIcon(title: 'My courses', icon: Icons.school),
                CategoryIcon(
                  title: 'Online course',
                  icon: Icons.live_tv,
                  isActive: true,
                ),
                CategoryIcon(title: 'Category', icon: Icons.grid_view),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Bottom horizontal card row
          SizedBox(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                CategoryCard(image: 'assets/images/e.png', label: 'Expert Instructors'),
                CategoryCard(image: 'assets/images/f.png', label: 'Flexible Learning'),
                CategoryCard(image: 'assets/images/h.png', label: 'Hands-On Learning'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;

  const CategoryIcon({
    super.key,
    required this.title,
    required this.icon,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 26,
          color: isActive ? Colors.orange : Colors.black,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.orange : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String label;

  const CategoryCard({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(195, 211, 220, 241),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Image.asset(image, height: 60),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
