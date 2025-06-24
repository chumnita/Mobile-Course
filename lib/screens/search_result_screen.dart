import 'package:flutter/material.dart';
import '../widgets/footer_section.dart'; // ✅ Your existing footer

class SearchResultScreen extends StatelessWidget {
  final String query;

  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> results = List.generate(
      5,
      (_) => {
        'image': 'assets/images/word.png',
        'title': 'Computer Network',
        'description':
            'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally or remotely.',
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // 🔍 Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              readOnly: true,
              controller: TextEditingController(text: query),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search...',
                fillColor: Colors.grey[200],
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),

          // 🔶 Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _tab("All", true),
                _tab("Courses", false),
                _tab("Projects", false),
                _tab("PRO sessions", false),
              ],
            ),
          ),

          // 🔽 Scrollable Results + Footer
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // Courses
                ...results.map((course) => _courseCard(course)).toList(),

                const SizedBox(height: 16),

                // Load More
                Center(
                  child: Text(
                    "Load More...",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // ✅ Your Footer
                const FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selected ? Colors.orange : Colors.grey,
        ),
      ),
    );
  }

  Widget _courseCard(Map<String, String> course) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              course['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          text: course['description']!.substring(0, 100),
                        ),
                        TextSpan(
                          text: ' See more...',
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.favorite_border, size: 14),
                      SizedBox(width: 4),
                      Text("កំរិតដំបូង", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 12),
                      Icon(Icons.access_time, size: 14),
                      SizedBox(width: 4),
                      Text("99នាក់បានរៀន", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
