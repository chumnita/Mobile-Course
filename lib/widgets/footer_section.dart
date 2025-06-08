import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Worktency logo left
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/logo.jpg',
              height: 30,
            ),
          ),
          const SizedBox(height: 24),

          // Footer titles + links
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FooterColumn(
                title: 'About Us',
                items: [
                  'Contact Us',
                  'FAQs',
                  'Community Forum',
                  'Term of Service',
                  'Careers',
                  'Leadership',
                  'Blog',
                ],
              ),
              FooterColumn(
                title: 'Social Impact',
                items: [
                  'Cookies Setting',
                  'Terms',
                  'Accessibility Statement',
                  'Investors',
                  'GO Pro Course',
                  'Affiliate',
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Certified
          const Text(
            'Certified',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/itc.png',
            height: 60,
          ),

          const SizedBox(height: 24),

          // Social media (centered image)
          Image.asset(
            'assets/images/social.png',
            height: 24,
          ),

          const SizedBox(height: 24),

          const Text(
            '© 2025 Worktency, Inc. All rights reserved.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterColumn({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                item,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
