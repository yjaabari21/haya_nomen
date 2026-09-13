import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LostGrav extends StatelessWidget {
  const LostGrav({super.key});

  InlineSpan _timelinePart(String title, String description) {
    return TextSpan(
      children: [
        TextSpan(
          text: '$title\n',
          style: const TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        TextSpan(text: '$description\n\n'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ماذا لو فقدنا الجاذبية؟",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  Padding(
                    padding: EdgeInsetsGeometry.all(10.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      '''هناك قوة تعمل حولنا في كل لحظة، لا نراها ولا نسمعها ولا نحسّ بها إلا حين نتعثر أو نسقط: الجاذبية. نحن نعيش فيها كما تعيش السمكة في الماء، لا نلاحظها لأنها لم تتوقف يومًا واحدًا. ولعلّ أعظم دليل على كمال هذه النعمة أننا نسيناها.
هذه الفقرة ستحاول أن تجيب على سؤال بسيط في صياغته، مرعب في تفاصيله: ماذا لو فقدنا الجاذبية؟ وهو سؤال لا نطرحه لنخيف أنفسنا، بل لنعرف قدر ما نحن فيه، ونتأمل في دقة التقدير الذي وُضعنا فيه: ﴿وَخَلَقَ كُلَّ شَيْءٍ فَقَدَّرَهُ تَقْدِيرًا﴾ الفرقان: 2.''',
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
                                'lib/assets/images/grav1.png',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Image.asset(
                        'lib/assets/images/grav1.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    '''الجاذبية ليست جهازًا يمكن إطفاؤه، بل هي خاصية أصيلة في الكتلة نفسها: كل جسم له كتلة يجذب كل جسم آخر له كتلة. وكلما زادت الكتلة زادت قوة الجذب، وكلما زادت المسافة ضعفت. وعلى سطح الأرض تُترجم هذه القوة إلى تسارع مقداره نحو 9.8 متر لكل ثانية مربعة، وهو الرقم الذي بُنيت عليه أجسامنا وعمائرنا وحياتنا كلها.
                      ومن الأمانة العلمية أن نقول: لا يمكن للجاذبية أن "تختفي" فعليًا، لأن اختفاءها يعني اختفاء الكتلة ذاتها. لكن تخيّل اختفائها هو من أفضل الطرق لفهم حجم ما تفعله، كما تشير مصادر تعليم الفيزياء التي تصف الجاذبية بأنها "الصمغ البنيوي" للكوكب كله.''',
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                                'lib/assets/images/grav_info.png',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Image.asset(
                        'lib/assets/images/grav_info.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "لو غابت الجاذبية… جدول زمني للكارثة",
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 17,
                        height: 1.7,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black87,
                      ),
                      children: [
                        _timelinePart(
                          'اللحظة الأولى — صفر ثانية',
                          'لا صوت ولا ضوء ولا إنذار. مجرد شعور غريب في المعدة، كذلك الذي تحسّه في قمة الأفعوانية. وزنك يصبح صفرًا فورًا، لكن قدماك ما تزالان على الأرض، إذ لم يدفعك شيء بعد.',
                        ),
                        _timelinePart(
                          'الثواني الأولى',
                          'تبدأ بالطفو، لكن ببطء شديد، بضعة سنتيمترات فقط عن الأرض. الماء في الأكواب يتحول إلى كرات مرتجفة. الأشياء الصغيرة تنزلق وتسبح. الغلاف الجوي يبدأ التوسع خارجًا. والأخطر: الأرض ما تزال تدور بك بسرعة تصل عند خط الاستواء إلى ما يقارب 1600 كم في الساعة، لكنك لم تعد ملزمًا بمنحنى سطحها.',
                        ),
                        _timelinePart(
                          'الدقائق الأولى',
                          'كل ما ليس مثبّتًا يتحول إلى مقذوف: الحصى، الغبار، الأثاث، المياه الضحلة، الأشخاص. لا خطر من "السقوط"، بل من الطيران بسرعة القذيفة والارتطام. المحيطات تبدأ الانسلاخ من أحواضها. تظهر بينك وبين السماء طبقة من الحطام الطافي.',
                        ),
                        _timelinePart(
                          'الساعات الأولى',
                          'الغلاف الجوي يتمدد ويتخلخل، فينخفض الضغط الجوي بسرعة. عند ضغط منخفض بما يكفي، تعجز الرئة عن نقل الأكسجين إلى الدم حتى لو كان الهواء موجودًا. تبدأ درجات الحرارة في التطرف لأن الهواء هو بطانيتنا الحرارية.',
                        ),
                        _timelinePart(
                          'الأيام والأسابيع',
                          'المياه المتصاعدة تحمل معها الحياة البحرية كلها. القشرة الأرضية تفقد الضغط الذي يشدّها، فتنشط الزلازل والتشققات، وتتفكك البنية الصخرية التي كانت مضغوطة بوزن نفسها. النواة المنصهرة تفقد الضغط الهائل الذي يحفظ حالتها، فيضطرب المجال المغناطيسي الذي يحمينا من الإشعاع الشمسي.',
                        ),
                        _timelinePart(
                          'النهاية',
                          'تفقد الأرض مدارها حول الشمس فتنطلق في خط مستقيم في الظلام. ويفقد القمر مداره. وتفقد المجرة نفسها ما يربطها. الكون كله بلا جاذبية ليس كونًا فوضويًا فقط، بل كون لم تتشكل فيه شمس أصلًا، لأن النجوم لا تولد إلا حين تجمع الجاذبية غاز الهيدروجين وتضغطه حتى يشتعل الاندماج النووي. أي: لا شمس، لا ضوء، لا كواكب، لا حياة.',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
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
                                'lib/assets/images/grav-syp.png',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Image.asset(
                        'lib/assets/images/grav-syp.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    '''هذه كلها آثار انعدام الجاذبية على أجساد مدرَّبة، تعيش داخل مركبة محكمة، بأكسجين وضغط ومياه وبرنامج رياضي يومي وإشراف طبي مستمر. فتخيل الأثر على كوكب بلا شيء من ذلك.''',
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 35),
                  Text(
                    "تأمل في عظمة الخلق",
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    '''الذي يلفت النظر في الجاذبية ليس وجودها، بل مقدارها. لو كانت أقوى بقليل لانضغط كل شيء: لعجزنا عن الحركة والوقوف، ولانسحب الغلاف الجوي حتى صار خانقًا كثيفًا، ولاحتُرقت النجوم بسرعة قبل أن تنشأ حياة. ولو كانت أضعف بقليل لتبدد الهواء والماء، ولما تجمعت المادة أصلًا لتكوّن نجمًا ولا كوكبًا. الجاذبية معايَرة بدقة تجعل الكوكب صالحًا للسكن، لا بالكثير ولا بالقليل.
                    
وهذا هو المعنى الذي يشير إليه القرآن بلفظ الميزان: ﴿وَالسَّمَاءَ رَفَعَهَا وَوَضَعَ الْمِيزَانَ﴾ الرحمن: 7 والذي يقرره في الإمساك: ﴿إِنَّ اللَّهَ يُمْسِكُ السَّمَاوَاتِ وَالْأَرْضَ أَن تَزُولَا﴾ فاطر: 41 وفي رفع السماء بلا أعمدة مرئية: ﴿اللَّهُ الَّذِي رَفَعَ السَّمَاوَاتِ بِغَيْرِ عَمَدٍ تَرَوْنَهَا﴾ الرعد: 2 فالسماء مرفوعة، والأرض مبسوطة، والأجرام سابحة، وكل ذلك على قوة لا تُرى ولا تُلمس: ﴿وَالْأَرْضَ وَضَعَهَا لِلْأَنَامِ﴾ الرحمن: 10

ثم تأمل هذه النقطة: الجاذبية مجانية. لا تُشترى ولا تُصان ولا تنقطع ولا تحتاج طاقة نمدّها بها. تعمل بالانتظام نفسه في قاعة العرش وفي كوخ الفقير، ليلًا ونهارًا، منذ ملايين السنين، بلا توقف لحظة واحدة. أي منشأة بشرية بلغت هذا القدر من الموثوقية؟
ولعل أعجب ما فيها أنها نعمة خفية. الشمس نراها فنشكرها، والماء نشربه فنحسّ به، أما الجاذبية فنعمة لا تُدرَك إلا بالتفكير. وهي بذلك نموذج لعشرات النعم التي نغفل عنها: انتظام دقات القلب، وثبات نسبة الأكسجين، وميل محور الأرض، والغلاف المغناطيسي.

﴿وَإِن تَعُدُّوا نِعْمَتَ اللَّهِ لَا تُحْصُوهَا﴾ النحل: 18
''',
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
