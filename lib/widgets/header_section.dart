import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top bar with logo and icons (optional)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/logo.jpg', height: 28),
              const Spacer(),
              const Icon(Icons.search),
              const SizedBox(width: 12),
              const Icon(Icons.person_outline),
            ],
          ),
          const SizedBox(height: 24),

          // Headline
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Unlock Your Potential\nwith ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Worktency',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Subtitle
          const Text(
            'Discover industry-leading courses designed to equip you\nwith real-world skills. Join our community and start your\njourney to success today.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
          const SizedBox(height: 16),

          // Image of person
          Image.asset('assets/images/he.png', height: 120),

          const SizedBox(height: 16),

          // Buttons wrapped safely
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                icon: const Icon(Icons.menu_book),
                label: const Text('Explore Courses'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                icon: const Icon(Icons.school),
                label: const Text('Join as an educator'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
