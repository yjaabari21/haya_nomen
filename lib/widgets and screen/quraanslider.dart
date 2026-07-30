import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Quraanslider extends StatelessWidget {
  const Quraanslider({super.key});

  final List<String> images = const [
    'lib/assets/images/aya1.png',
    'lib/assets/images/aya2.png',
    'lib/assets/images/aya3.png',
    'lib/assets/images/aya4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        aspectRatio: 16 / 9,
        viewportFraction: 0.28,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollPhysics: const BouncingScrollPhysics(),
      ),
      items: images.map((image) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(image, fit: BoxFit.cover, width: double.infinity),
        );
      }).toList(),
    );
  }
}
