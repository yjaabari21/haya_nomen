import 'package:flutter/material.dart';
import 'package:haya_nomen/widgets%20and%20screen/splash.dart';
import 'theme.dart';
import 'theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeController = ThemeController();

  await themeController.loadTheme();

  runApp(MyApp(themeController: themeController));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;

  const MyApp({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'هيا نؤمن',

          theme: AppTheme.lightTheme,

          darkTheme: AppTheme.darkTheme,

          themeMode: themeController.themeMode,

          home: SplashScreen(themeController: themeController),
        );
      },
    );
  }
}
