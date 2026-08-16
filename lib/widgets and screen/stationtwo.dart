import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StationTwo extends StatelessWidget {
  const StationTwo({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      title,
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
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
                                'lib/assets/images/talk-map.png',
                                width: double.infinity,
                                height: 1000,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/talk-map.png',
                      width: 350,
                      height: 350,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      "مغامرة قطرة",
                    ),
                  ),
                  const SizedBox(height: 12),
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
                                'lib/assets/images/drop.jpeg',
                                width: double.infinity,
                                height: 1000,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/drop.jpeg',
                      width: 350,
                      height: 350,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
