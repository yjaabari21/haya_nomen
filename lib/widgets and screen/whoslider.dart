import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WhoSlider extends StatelessWidget {
  const WhoSlider({super.key});

  final List<String> images = const [
    'lib/assets/images/lion-eat.jpg',
    'lib/assets/images/deer-kid.jpg',
    'lib/assets/images/dog-drink.png',
    'lib/assets/images/cat-tang.png',
    'lib/assets/images/no-thumb.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
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
