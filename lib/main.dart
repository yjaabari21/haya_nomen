import 'package:flutter/material.dart';
import 'package:haya_nomen/l10n/app_localizations.dart';
import 'package:haya_nomen/widgets%20and%20screen/lang_controller.dart';
import 'package:haya_nomen/widgets%20and%20screen/splash.dart';
import 'theme.dart';
import 'theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeController = ThemeController();
  final langController = LanguageController();

  await themeController.loadTheme();
  await langController.loadLanguage();

  runApp(
    MyApp(themeController: themeController, languageController: langController),
  );
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;
  final LanguageController languageController;

  const MyApp({
    super.key,
    required this.themeController,
    required this.languageController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([themeController, languageController]),

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          onGenerateTitle: (context) => AppLocalizations.of(context)!.hayaNomen,

          theme: AppTheme.lightTheme,

          darkTheme: AppTheme.darkTheme,

          themeMode: themeController.themeMode,

          locale: languageController.locale,

          supportedLocales: AppLocalizations.supportedLocales,

          localizationsDelegates: AppLocalizations.localizationsDelegates,

          home: SplashScreen(
            themeController: themeController,
            languageController: languageController,
          ),
        );
      },
    );
  }
}
