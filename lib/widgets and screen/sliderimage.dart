import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:haya_nomen/widgets%20and%20screen/brostalk.dart';
import 'package:haya_nomen/widgets%20and%20screen/quiz_screen.dart';
import 'package:haya_nomen/widgets%20and%20screen/storiesdetails.dart';
import 'package:haya_nomen/widgets%20and%20screen/waterdetails.dart';
import 'package:haya_nomen/widgets%20and%20screen/whatlost.dart';

class SliderImage extends StatelessWidget {
  SliderImage({super.key});

  // ignore: library_private_types_in_public_api
  final List<_SliderItem> slides = [
    _SliderItem(image: 'lib/assets/images/cover1.png', page: WaterDetails()),
    _SliderItem(image: 'lib/assets/images/cover2.png', page: WhatLost()),
    _SliderItem(image: 'lib/assets/images/cover3.png', page: StoriesDetails()),
    _SliderItem(image: 'lib/assets/images/test.png', page: QuizScreen()),
    _SliderItem(image: 'lib/assets/images/cover4.png', page: Brostalk()),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.65,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: slides.map((slide) {
        return Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => slide.page),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  slide.image,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class _SliderItem {
  final String image;
  final Widget page;

  const _SliderItem({required this.image, required this.page});
}
