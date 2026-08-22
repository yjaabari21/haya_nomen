import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/widgets%20and%20screen/audioplayer.dart';
import 'package:haya_nomen/widgets%20and%20screen/videoplayer.dart';
import 'package:haya_nomen/widgets%20and%20screen/wholostquest.dart';

class LostThumb extends StatelessWidget {
  const LostThumb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ماذا لو فقدنا الإبهام؟",
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 50),
                Center(child: WhoLostQuest()),
                SizedBox(height: 25),
                Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                  'كرّم الله الإنسان بيديه، وخاصة بالإبهام، الذي يمنحه قدرة على الإمساك بالأشياء بدقة وقوة، مما يساعده على استخدام الأدوات وإنجاز الأعمال المختلفة مثل الكتابة والرسم والجراحة. ويتميز الإنسان عن القرد بقدرته على التحكم الدقيق في استخدام يديه، إضافة إلى قدرته على التعلم والتعبير عن أفكاره ومشاعره. لذلك كان الإبهام من أهم النعم التي أسهمت في تدوين العلم، واختراع الأدوات، وبناء الحضارة الإنسانية.',
                ),
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
                              'lib/assets/images/thumb.png',
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'lib/assets/images/thumb.png',
                    width: 500,
                    height: 500,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                  "تتميز مفاصل أصابع الإنسان بدقة تجمع بين الصلابة والمرونة، ومربوطة بأوتار وأعصاب للتحكم والاستجابة السريعة. ,إذا فقد الإنسان إصبع الإبهام فقط، فلن يفقد يده بالكامل، لكنه سيفقد أهم إصبع فيها وظيفيًا. يقدّر علماء التشريح وجراحة اليد أن الإبهام يساهم بما يقارب 40–50% من كفاءة ووظيفة اليد، وذلك بسبب موقعه الفريد وقدرته على مقابلة بقية الأصابع",
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
                              'lib/assets/images/thumb-ana3.png',
                              width: double.infinity,
                              height: 1000,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset('lib/assets/images/thumb-ana3.png'),
                ),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                  "نعم، الدماغ يمتلك قدرة على التكيف، وقد يتعلم الشخص استخدام السبابة والوسطى بطرق مختلفة، لكن لا يمكن تعويض جميع وظائف الإبهام بشكل كامل. وفي بعض الحالات يمكن للجراحين إعادة بناء الإبهام أو حتى نقل أحد أصابع القدم ليقوم بوظيفته، لما للإبهام من أهمية كبيرة",
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                  "فقدان الإبهام لا يعني فقدان اليد، لكنه يعني خسارة ما يقارب نصف كفاءتها الوظيفية. ستصبح أبسط المهام اليومية، مثل الإمساك بالقلم، وفتح الباب، وحمل الأشياء، واستخدام الهاتف، أكثر صعوبة بسبب فقدان الإصبع المسؤول عن القبضة الدقيقة والقوية.",
                ),
                const SizedBox(height: 30),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    '''﴿أَیَحۡسَبُ ٱلۡإِنسَـٰنُ أَلَّن نَّجۡمَعَ عِظَامَهُۥ ﴿3﴾ بَلَىٰ قَـٰدِرِینَ عَلَىٰۤ أَن نُّسَوِّیَ بَنَانَهُ﴾ [القيامة 3-4]''',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
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
                              'lib/assets/images/compare.png',
                              width: double.infinity,
                              height: 1000,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset('lib/assets/images/compare.png'),
                ),
                const SizedBox(height: 16),
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
                              'lib/assets/images/fingprint.png',
                              width: double.infinity,
                              height: 1000,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset('lib/assets/images/fingprint.png'),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => {},
                        icon: const Icon(Icons.volume_up_rounded),
                        label: const Text("استمع لإعجاز علمي في الآية"),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AudioPlay(),
                const SizedBox(height: 24),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.95,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const VideoPlayerScreen(
                              videoPath:
                                  'https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya1.mp4',
                              title: 'سورة التين',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'lib/assets/images/aya1-cov.png',
                        width: 350,
                        height: 350,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const VideoPlayerScreen(
                              videoPath:
                                  'https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya2.mp4',
                              title: 'سورة القيامة 3-4',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'lib/assets/images/aya2-cov.png',
                        width: 350,
                        height: 350,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const VideoPlayerScreen(
                              videoPath:
                                  'https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya3.mp4',
                              title: 'سورة نون',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'lib/assets/images/aya3-cov.png',
                        width: 350,
                        height: 350,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const VideoPlayerScreen(
                              videoPath:
                                  'https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya4.mp4',
                              title: 'سورة العلق',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'lib/assets/images/aya4-cov.png',
                        width: 350,
                        height: 350,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                //Quraanslider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
