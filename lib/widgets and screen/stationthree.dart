import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/widgets%20and%20screen/videoplayer.dart';

class StationThree extends StatelessWidget {
  const StationThree({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      "لا يقتصر نفع ماء المطر على الإنسان وحده، بل يشمل جميع المخلوقات. الله يحيي الأرض بالماء بعد موتها، فتنبت به شتى أنواع الزروع والثمار، فيأكل منها الناس، وترعى منها الحيوانات التي ينتفعون بها، ويظل الماء نعمة عظيمة بها تستمر الحياة على الأرض",
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VideoPlayerScreen(
                            videoPath:
                                'https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/rain_quran.mp4',
                            title: 'فوائد مياه الأمطار',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/rq-cover.png',
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VideoPlayerScreen(
                            videoPath:
                                'https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/raining.mp4',
                            title: 'فوائد مياه الأمطار',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/raining.png',
                      width: 350,
                      height: 350,
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "الإنسان لم يبذل أي مجهود لنزول الماء، الفضل كله لله والنعمة مصدرها ربنا الرحيم الكريم الذي يغيثنا ويغيث كل المخلوقات بماء نقي ينزل من السماء...الله برحمته جعله عذبا، ولم يجعله مالحا مع أن مصدره البحر المالح",
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
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
                                'lib/assets/images/ftalks.png',
                                width: double.infinity,
                                height: 1000,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/ftalks.png',
                      width: 350,
                      height: 350,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
