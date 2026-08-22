import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/widgets%20and%20screen/videoplayer.dart';
//import 'package:haya_nomen/widgets%20and%20screen/videoplayer.dart';
//import 'package:video_player/video_player.dart';

class BeesTrip extends StatelessWidget {
  const BeesTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "رحلة ملعقة العسل",
            style: GoogleFonts.ibmPlexSansArabic(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'المحطة الأولى: أهمية النحل للبيئة وفوائده',
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: InteractiveViewer(
                              minScale: 1,
                              maxScale: 5,
                              child: Image.asset(
                                'lib/assets/images/sta1.png',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/sta1.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'المحطة الثانية: مراحل حياة النحل',
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            videoPath:
                                'https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/bees.mp4',
                            title: 'أهمية النحل للبيئة وفوائده',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/bee-cov.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'المحطة الثالثة: تشريح جسم النحل',
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: InteractiveViewer(
                              minScale: 1,
                              maxScale: 5,
                              child: Image.asset(
                                'lib/assets/images/bees_anatomy.png',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/bees_anatomy.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'المحطة الرابعة: أهمية النحل في تلقيح النباتات',
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: InteractiveViewer(
                              minScale: 1,
                              maxScale: 5,
                              child: Image.asset(
                                'lib/assets/images/sta4.png',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/sta4.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'الجزء الأول - Part 1',
                            style: GoogleFonts.ibmPlexSansArabic(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: InteractiveViewer(
                              minScale: 1,
                              maxScale: 5,
                              child: Image.asset(
                                'lib/assets/images/sta4-p2.png',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/sta4-p2.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'الجزء الثاني - Part 2',
                            style: GoogleFonts.ibmPlexSansArabic(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'قال الله تعالى: ﴿إِنَّا كُلَّ شَیۡءٍ خَلَقۡنَـٰهُ بِقَدَرࣲ﴾ [القمر 49]',
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
