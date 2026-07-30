import 'package:flutter/material.dart';
import 'package:haya_nomen/widgets%20and%20screen/videoscreen.dart';

class StoriesDetails extends StatelessWidget {
  const StoriesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("قصص إيمانية")),
      body: const Center(child: VideoScreen()),
    );
  }
}
