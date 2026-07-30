import 'package:flutter/material.dart';
import 'package:haya_nomen/aboutindex.dart';
import 'package:haya_nomen/tadbor.dart';
import 'package:haya_nomen/widgets%20and%20screen/brostalk.dart';
import 'package:haya_nomen/widgets%20and%20screen/catecards.dart';
import 'package:haya_nomen/widgets%20and%20screen/quiz_screen.dart';
import 'package:haya_nomen/widgets%20and%20screen/storiesdetails.dart';
import 'package:haya_nomen/widgets%20and%20screen/tripsdetails.dart';
import 'package:haya_nomen/widgets%20and%20screen/whatlost.dart';
import 'package:haya_nomen/widgets%20and%20screen/sliderimage.dart';

class HomeIndex extends StatelessWidget {
  const HomeIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'ميزة الترجمة قيد التطوير',
                    style: TextStyle(
                      color: Color.fromARGB(255, 233, 181, 24),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.blue,
                ),
              );
            },
          ),
        ),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'هيا نؤمن',
            style: TextStyle(
              color: Color(0xFFB8860B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 103, 208, 222),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutIndex()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'lib/assets/images/Colour 2.png',
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
            SizedBox(height: 250, child: SliderImage()),
            SizedBox(height: 32),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                CategoryCard(
                  title: "قصص إيمانية",
                  image: "lib/assets/images/story book.gif",
                  page: const StoriesDetails(),
                  cardColor: const Color(0xFF4FC3F7),
                ),
                CategoryCard(
                  title: "رحلات إيمانية",
                  image: "lib/assets/images/mig.gif",
                  page: const TripsDetails(),
                  cardColor: const Color(0xFFB8860B),
                ),
                CategoryCard(
                  title: "ماذا لو فقدنا!",
                  image: "lib/assets/images/warning.gif",
                  page: const WhatLost(),
                  cardColor: const Color(0xFF4FC3F7),
                ),
                CategoryCard(
                  title: "اختبارات",
                  image: "lib/assets/images/quiz.gif",
                  page: const QuizScreen(),
                  cardColor: const Color(0xFFB8860B),
                ),
                CategoryCard(
                  title: "تدبر الآيات",
                  image: "lib/assets/images/tadbor.png",
                  page: const Tadbor(),
                  cardColor: const Color(0xFF4FC3F7),
                ),
                CategoryCard(
                  title: "عبود و فطوم و الشاشة اللبيبة",
                  image: "lib/assets/images/card-cov.png",
                  page: const Brostalk(),
                  cardColor: const Color(0xFFB8860B),
                ),
              ],
            ),
            SizedBox(height: 20),
            // SizedBox(
            //   width: double.infinity,
            //   height: 320,
            //   child: InkWell(
            //     onTap: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Tadbor()),
            //     ),
            //     child: Card(
            //       elevation: 5,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //       child: Column(
            //         children: [
            //           Expanded(
            //             child: Image.asset(
            //               '',
            //               fit: BoxFit.cover,
            //               height: 200,
            //               width: double.infinity,
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text(
            //               "تدبر الآيات",
            //               style: GoogleFonts.ibmPlexSansArabic(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 30),
            // SizedBox(
            //   width: double.infinity,
            //   height: 320,
            //   child: InkWell(
            //     onTap: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Paintings()),
            //     ),
            //     child: Card(
            //       elevation: 5,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //       child: Column(
            //         children: [
            //           Expanded(
            //             child: Image.asset(
            //               'lib/assets/images/paint.png',
            //               fit: BoxFit.cover,
            //               width: double.infinity,
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text(
            //               "لوحات فنية تحت المجهر",
            //               style: GoogleFonts.ibmPlexSansArabic(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
