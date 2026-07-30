import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/widgets%20and%20screen/videoplayer.dart';

class StationFour extends StatelessWidget {
  const StationFour({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                                'lib/assets/images/hadiy.png',
                                width: double.infinity,
                                height: 1000,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/hadiy.png',
                      width: 500,
                      height: 500,
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
                                'lib/assets/images/adab 2.png',
                                width: double.infinity,
                                height: 1000,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/adab 2.png',
                      width: 500,
                      height: 500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        '''
إذا تأخر المطر، وأجدبت الأرض، تسبب ذلك في موت الزرع والحيوانات، وندر الماء وارتفعت أسعار الطعام.
قد يكون ذلك بسبب ذنوب الناس، وقد يكون ابتلاءً لهم، وعلى أي حال فإن الناس يلزمهم التوبة الصادقة ولزوم الإستغفار والتضرع، والتذلل لله تعالى وإظهار الفقر بين يديه فهو الذي يملك المطر.
 يقول تعالى: ﴿وَیَـٰقَوۡمِ ٱسۡتَغۡفِرُوا۟ رَبَّكُمۡ ثُمَّ تُوبُوۤا۟ إِلَیۡهِ یُرۡسِلِ ٱلسَّمَاۤءَ عَلَیۡكُم مِّدۡرَارࣰا﴾ [هود 52]
وقد شرع لنا النبي ﷺ صلاة الاستسقاء لنستمع لهذا الحديث الشريف:
''',
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VideoPlayerScreen(
                            videoPath:
                                'https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/station4.mp4',
                            title: 'صلاة الإستسقاء و أهميتها',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/st4.png',
                      width: 350,
                      height: 350,
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
