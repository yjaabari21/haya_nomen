import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StationOne extends StatelessWidget {
  const StationOne({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      title,
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                              'lib/assets/images/water-talks.jpeg',
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'lib/assets/images/water-talks.jpeg',
                    width: double.infinity,
                    height: 500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
