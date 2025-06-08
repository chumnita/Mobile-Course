import 'package:flutter/material.dart';

class FeaturedCourseSection extends StatelessWidget {
  const FeaturedCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Course',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2A4A),
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                CourseTab(title: 'Artificial Intelligent', selected: true),
                CourseTab(title: 'Machine Learning', selected: false),
                CourseTab(title: 'Self Development', selected: false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 550,
            child: PageView.builder(
              itemCount: 2,
              controller: PageController(viewportFraction: 1),
              itemBuilder: (context, pageIndex) {
                return GridView.builder(
                  padding: const EdgeInsets.only(right: 8),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 270,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) => const CourseCard(),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dot(isActive: true),
              Dot(),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseTab extends StatelessWidget {
  final String title;
  final bool selected;

  const CourseTab({super.key, required this.title, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          if (selected)
            Container(
              height: 2,
              width: 40,
              color: Colors.orange,
            ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.orange : Colors.grey.shade300,
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset('assets/images/word.png', height: 50),
          const SizedBox(height: 10),
          const Text(
            'Microsoft word',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
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
