import 'package:flutter/material.dart';
import 'package:haya_nomen/widgets%20and%20screen/lang_controller.dart';
import 'package:haya_nomen/widgets%20and%20screen/tabbar.dart';
import 'package:haya_nomen/theme_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.themeController,
    required this.languageController,
  });

  final ThemeController themeController;
  final LanguageController languageController;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => TabsBar(
            themeController: widget.themeController,
            languageController: widget.languageController,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00C9C8), Color(0xFF0097A7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("lib/assets/images/Colour 1.png", width: 280),
                const SizedBox(height: 25),
                // const Text(
                //   "هيا نؤمن",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 1,
                //   ),
                // ),
                const SizedBox(height: 30),
                const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
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
