import 'package:flutter/material.dart';
import 'package:haya_nomen/widgets%20and%20screen/videoplayer.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            videoCard(
              context,
              title: "قصة شاكر و شركان",
              image: "lib/assets/images/video1.png",
              video:
                  "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/shaker_sharkan.mp4",
            ),

            const SizedBox(height: 20),

            videoCard(
              context,
              title: "قصة مهرجان الألوان",
              image: "lib/assets/images/video2.png",
              video:
                  "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/alwan%20edited.mp4",
            ),
          ],
        ),
      ),
    );
  }

  Widget videoCard(
    BuildContext context, {
    required String title,
    required String image,
    required String video,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VideoPlayerScreen(videoPath: video, title: title),
            ),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
