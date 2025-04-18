import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'title': 'Stress',
      'imageUrl':
          'https://images.pexels.com/photos/8981857/pexels-photo-8981857.jpeg'
    },
    {
      'title': 'Anxiety and Panic Attacks',
      'imageUrl':
          'https://images.pexels.com/photos/4101143/pexels-photo-4101143.jpeg'
    },
    {
      'title': 'Depression',
      'imageUrl':
          'https://images.pexels.com/photos/4560080/pexels-photo-4560080.jpeg'
    },
    {
      'title': 'Mindfulness',
      'imageUrl':
          'https://images.pexels.com/photos/3822621/pexels-photo-3822621.jpeg'
    },
  ];

  LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      categories[index]['imageUrl']!,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Text(
                    categories[index]['title']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
