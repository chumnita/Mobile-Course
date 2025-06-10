import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final VoidCallback onExploreTap;

  const HeaderSection({super.key, required this.onExploreTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top row with logo and icons
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

          // Title with highlight
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Unlock Your Potential\nwith ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
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

          // Hero image
          Image.asset('assets/images/he.png', height: 120),
          const SizedBox(height: 16),

          // Buttons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: onExploreTap, // ✅ Route handled from LandingPage
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
                onPressed: () {
                  // TODO: Add action for educator
                },
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
