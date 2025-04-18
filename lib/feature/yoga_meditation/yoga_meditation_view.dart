import 'package:flutter/material.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/utils/image_resource.dart';
import 'package:url_launcher/url_launcher.dart';

class YogaMeditationScreen extends StatelessWidget {
  YogaMeditationScreen({super.key});

  final List<Map<String, String>> yogaItems = [
    {
      'title': 'Hatha Yoga',
      'image':
          'https://images.pexels.com/photos/3822621/pexels-photo-3822621.jpeg',
      'url': 'https://en.wikipedia.org/wiki/Hatha_yoga'
    },
    {
      'title': 'Vinyasa Flow',
      'image':
          'https://images.pexels.com/photos/1051838/pexels-photo-1051838.jpeg',
      'url': 'https://en.wikipedia.org/wiki/Vinyasa'
    },
    {
      'title': 'Meditation Basics',
      'image':
          'https://images.pexels.com/photos/2908176/pexels-photo-2908176.jpeg',
      'url': 'https://en.wikipedia.org/wiki/Meditation'
    },
    {
      'title': 'Mindfulness',
      'image':
          'https://images.pexels.com/photos/3822354/pexels-photo-3822354.jpeg',
      'url': 'https://en.wikipedia.org/wiki/Mindfulness'
    },
    {
      'title': 'Pranayama',
      'image':
          'https://images.pexels.com/photos/4325465/pexels-photo-4325465.jpeg',
      'url': 'https://en.wikipedia.org/wiki/Pranayama'
    },
    {
      'title': 'Ashtanga',
      'image':
          'https://images.pexels.com/photos/1778173/pexels-photo-1778173.jpeg',
      'url': 'https://en.wikipedia.org/wiki/Ashtanga_vinyasa_yoga'
    },
    {
      'title': 'Yoga Nidra',
      'image':
          'https://images.pexels.com/photos/3822622/pexels-photo-3822622.jpeg',
      'url': 'https://en.wikipedia.org/wiki/Yoga_nidra'
    },
    {
      'title': 'Zen Meditation',
      'image':
          'https://images.pexels.com/photos/317157/pexels-photo-317157.jpeg',
      'url': 'https://en.wikipedia.org/wiki/Zazen'
    },
  ];

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: ColorPalettes.darkOrangeColor,
        title: const Text('YOGA & MEDITATION',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: yogaItems.length,
          itemBuilder: (context, index) {
            final item = yogaItems[index];
            return InkWell(
              onTap: () => _launchURL(item['url']!),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: FadeInImage.assetNetwork(
                        placeholder: ImageResource.placeHolderImage,
                        image: item['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        child: Text(
                          item['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
