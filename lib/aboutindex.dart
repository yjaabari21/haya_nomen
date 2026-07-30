import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutIndex extends StatelessWidget {
  const AboutIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "من نحن",
              style: TextStyle(
                color: const Color.fromARGB(255, 137, 111, 15),
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.cyan[300],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('lib/assets/images/Colour 1.png'),
                Center(
                  child: Container(
                    color: Colors.blueAccent,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "من نحن؟",
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  '''
اهتمامنا بالتربية الإيمانية موجه للأطفال والناشئة، وعبر خبرة تزيد على ربع قرن لاحظنا بأن هناك حلقة مفقودة في البناء الإيماني لم نجدها في كتب العقائد على جلالة قدرها كأطر تحفظ المؤمن من الشطط.
بتوفيق محض من الله تعالى اكتشفنا بأن ضالتنا بين أيدينا؛ إنها في الوحي بشقيه القرآن الكريم والسنة المطهرة، إن ما نحتاجه ببساطة هو أن نُسْلِمَ قِيادنا وقياد من نربيهم إلى منهج القرآن الفريد في بناء الإيمان وتزكية المؤمنين، ثم نتتبع كيف ترجم خاتم المرسلين ﷺ بشكل عملي ذلك المنهج الربَّاني.
إن الوحي بشقيه القرآن والسنة، عند بناء المؤمن يمس فطرته، ويحفز حواسَّه، ويغمر وجدانه، ويفحم عقله، ويثمر امتزاجًا بين أنواع التوحيد واستظلالا بأسماء الله الحسنى دون الخوض في نقاشات ذهنية باردة، كما يؤسس القرآن لاقتران لا ينفك بين الإيمان والعمل الصالح.
في مشروعنا القرآني "هيا نؤمن" نستلهم طريقة الوحي بترك القيادة للقرآن الذي يكرر التذكير بالرَبِّ الموجد والمرَبِّي، ويُعَرِّف الناس بأسمائه وصفاته وأفعاله عبر مشاهداتهم المحسوسة، مُتودِدًا إليهم بإنعامه وتلطفه، مخوِّفًا من حسابه والوقوف بين يديه، منتقلا بسلاسة إلى وجوب إفراده بالعبادة التي تشمل الشعائر والشرائع ومشاعر الحب والتعظيم والخضوع والرجاء والخوف والتوكل.
باستعمال وسائط سمعية وبصرية نصحب الأطفال والناشئة مع القرآن والسنة في رحلات إيمانية فريدة.
 "هيا نؤمن" نواة لمشروع إيماني قابل للنمو والتطوير، ويرحب بالناصحين.
 ''',
                  style: GoogleFonts.ibmPlexSansArabic(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Container(
                    color: Colors.blueAccent,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "حقوق الملكية الفكرية",
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "جميع محتويات هذا التطبيق وقفٌ لله تعالى، يُسمح بالنشر والتوزيع والاستخدام بدون إذن مسبق، شرط عدم التحريف وذكر المصدر تقديراً لا إلزاماً",
                  style: GoogleFonts.ibmPlexSansArabic(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
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
