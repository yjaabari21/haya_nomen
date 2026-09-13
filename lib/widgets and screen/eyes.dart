import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/l10n/app_localizations.dart';

class LostEyes extends StatelessWidget {
  const LostEyes({super.key});

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.whatIfLostSight;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
                Text(
                  title,
                  style: GoogleFonts.ibmPlexSansArabic(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
