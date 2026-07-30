import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class Tadbor extends StatefulWidget {
  const Tadbor({super.key});

  @override
  State<Tadbor> createState() => _TadborState();
}

class _TadborState extends State<Tadbor> {
  String? activeVideoPath;

  final List<Map<String, String>> videos = const [
    {
      "title": "أحسن تقويم",
      "video":
          "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya1.mp4",
      "description":
          "الله خلق الإنسان عاقلاً، منتصب القامة، قادرًا على استعمال يديه وأصابعه.",
    },
    {
      "title": "بين الصلابة والمرونة",
      "video":
          "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya2.mp4",
      "description":
          " الله أنعم على الإنسان فلم يُسوِّ أصابعه كخف البعير أو حافر الحمار إذ تتميز مفاصل أصابع الإنسان بدقة تجمع بين الصلابة والمرونة، ومربوطة بأوتار وأعصاب للتحكم والاستجابة السريعة خلق الله كل أصبع ببصمة دقيقة وخاصة وفريدة في كل إنسان.",
    },
    {
      "title": "الإبهام وتدوين العلوم",
      "video":
          "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya3.mp4",
      "description":
          "يقسم الله تعالى بالقلم أي الأداة التي يُكتب بها، ويقسم الله بما يُسَطَّره الكاتبون بالقلم من أنواع العلوم الدينية والدنيوية النافعة. لنتذكر أنه بدون إصبع الإبهام الذي ميَّز الله به الإنسان فتمكَّن بسببه من التحكم بالقلم لما كانت كتابة ولا توثيق للعلوم والآداب",
    },
    {
      "title": "معرفة الله أساس العلم",
      "video":
          "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya4.mp4",
      "description":
          "رَبُّنَا أمرنا أن ينطلق علمنا من الإقرار بأنه من خلقنا وأكرمنا وعَلَّمَنا وهو المستحق وحده للعبادة الطريق إلى المعرفة النافعة إنما يبدأ بمعرفة الله المؤمن يرد الفضل في كل ما تعلمه إلى الله الذي كرَّم الإنسان، ومنحه العقل، وعلمه البيان، وجعله يكتشف سائر العلوم، ومكَّنه من الكتابة بالقلم ولنتذكر دور إصبع الإبهام في الكتابة وتوثيق العلوم ونشرها.",
    },
    {
      "title": "إحياء الأموات",
      "video":
          "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya5.mp4",
      "description": "",
    },
    {
      "title": "نداء لتشغيل البصر",
      "video":
          "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya6.mp4",
      "description":
          "﴿ٱلۡأَرۡضِ ٱلۡجُرُزِ﴾ : القاحلة الجافة التي لا نبات فيها.",
    },
    {
      "title": "إعجاز قرآني في علم التربة",
      "video":
          "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya7.mp4",
      "description":
          ".يقول سيد قطب: الهمود درجة بين الحياة والموت. وهكذا تكون الأرض قبل الماء، فإذا نزل عليها الماء ﴿ٱهۡتَزَّتۡ وَرَبَتۡ﴾؛ وهي حركة عجيبة سجلها القرآن قبل أن تسجلها الملاحظة العلمية بمئات الأعوام، فالتربة الجافة حين ينزل عليها الماء تتحرك حركة اهتزاز وهي تتشرب الماء وتنتفخ فتربو، ثم تتفتح بالحياة ﴿وَأَنۢبَتَتۡ مِن كُلِّ زَوۡجِۭ بَهِیجࣲ﴾.",
    },
    {
      "title": "لكم... لكم !!",
      "video":
          "https://pub-246dfc78e70f4e26bb620d10a94f61a2.r2.dev/videos/aya8.mp4",
      "description": "﴿تُسِيمُونَ﴾ : تَرْعَوْنَ مَوَاشِيَكُمْ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: videos.length,
              itemBuilder: (context, index) {
                var item = videos[index];

                final isActive = activeVideoPath == item["video"];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ExpansionTile(
                    title: Text(item["title"]!),
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            activeVideoPath = item["video"];
                          });
                        },
                        child: isActive
                            ? SizedBox(
                                height: 250,
                                child: _InlineVideoPlayer(
                                  videoPath: item["video"]!,
                                ),
                              )
                            : Container(
                                height: 200,
                                color: Colors.black,
                                child: const Center(
                                  child: Icon(
                                    Icons.play_circle,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          textAlign: TextAlign.right,
                          item["description"]!,
                          style: GoogleFonts.ibmPlexSansArabic(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _InlineVideoPlayer extends StatefulWidget {
  final String videoPath;

  const _InlineVideoPlayer({required this.videoPath});

  @override
  State<_InlineVideoPlayer> createState() => _InlineVideoPlayerState();
}

class _InlineVideoPlayerState extends State<_InlineVideoPlayer> {
  late final VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoPath))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
          _controller.setLooping(true);
          _controller.play();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: _isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          icon: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
