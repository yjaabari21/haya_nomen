import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:haya_nomen/widgets%20and%20screen/videoplayer.dart';

class Brostalk extends StatelessWidget {
  const Brostalk({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("")),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoPlayerScreen(
                            videoPath:
                                "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/cate6%20video.mp4",
                            title: "عبود و فطوم و الشاشة اللبيبة",
                          ),
                        ),
                      ),
                    },
                    child: Image.asset(
                      'lib/assets/images/bros.png',
                      width: 500,
                      height: 500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "يمكنك متابعة باقي القصة على يوتيوب من خلال الرابط أدناه",
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 220,
                      maxWidth: 320,
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCC0000),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        elevation: 6,
                        shadowColor: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      icon: const Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 24,
                      ),
                      label: Text(
                        'شاهدونا على يوتيوب',
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        final Uri url = Uri.parse(
                          'https://www.youtube.com/watch?v=h6zuXeQameM&feature=youtu.be',
                        );
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        )) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'لم أستطع فتح الرابط. حاول مرة أخرى.',
                              ),
                            ),
                          );
                        }
                      },
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
