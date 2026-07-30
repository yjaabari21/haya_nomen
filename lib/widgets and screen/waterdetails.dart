import 'package:flutter/material.dart';
import 'stationfour.dart';
import 'stationone.dart';
import 'stationtwo.dart';
import 'stationthree.dart';

class _StationInfo {
  final String title;
  final String image;
  final Widget page;

  const _StationInfo({
    required this.title,
    required this.image,
    required this.page,
  });
}

class WaterDetails extends StatelessWidget {
  const WaterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final stations = <_StationInfo>[
      _StationInfo(
        title: 'المحطة الأولى: حوار بين أخوين',
        image: 'lib/assets/images/girl-boy.png',
        page: StationOne(title: 'المحطة الأولى: حوار بين أخوين'),
      ),
      _StationInfo(
        title: 'المحطة الثانية: رحلة كأس الماء',
        image: 'lib/assets/images/drop1.png',
        page: StationTwo(title: 'المحطة الثانية: رحلة كأس من الماء'),
      ),
      _StationInfo(
        title: 'المحطة الثالثة: الماء حياة',
        image: 'lib/assets/images/station3.png',
        page: StationThree(title: 'المحطة الثالثة: الماء حياة'),
      ),
      _StationInfo(
        title: 'المحطة الرابعة: نبينا ﷺ ونعمة الماء',
        image: 'lib/assets/images/station4.png',
        page: StationFour(title: 'المحطة الرابعة: نبينا ﷺ ونعمة الماء'),
      ),
      // _StationInfo(
      //   title: 'المحطة الخامسة - عودة الى حوار الصديقين',
      //   image: 'lib/assets/images/station5.png',
      //   page: StationFive(),
      // ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("")),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      '''نشرب كأس الماء البارد دون أن نتذكر أن قطرات الماء خاضت رحلة طويلة وشاقة حتى وصلتنا.
في المحطات التالية دعوة للتأمل والتدبر في رحمة الله وإنعامه علينا بنعمة كأس الماء العذب.''',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...stations.map((station) {
                    final card = Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset(
                              station.image,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              station.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => station.page),
                        ),
                        child: card,
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
