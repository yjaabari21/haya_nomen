import 'package:flutter/material.dart';
import 'package:haya_nomen/aboutindex.dart';
import 'package:haya_nomen/homeindex.dart';
import 'package:haya_nomen/l10n/app_localizations.dart';
import 'package:haya_nomen/theme_controller.dart';
import 'package:haya_nomen/widgets%20and%20screen/lang_controller.dart';
import 'package:haya_nomen/widgets%20and%20screen/listen.dart';
import 'package:haya_nomen/widgets%20and%20screen/searchscreen.dart';

class TabsBar extends StatefulWidget {
  final ThemeController themeController;
  final LanguageController languageController;

  const TabsBar({
    super.key,
    required this.themeController,
    required this.languageController,
  });

  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showLanguageDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'قيد التطوير - سيتم إضافة اختيار اللغة قريبًا',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        backgroundColor: Color(0xFF167A8C),
      ),
    );

    // اختيار اللغات متوقف مؤقتًا حتى تكتمل الترجمة.
    // showDialog<void>(
    //   context: context,
    //   builder: (dialogContext) => ...,
    // );
  }

  // =========================
  // Theme Dialog
  // =========================

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.appAppearance,
            textAlign: TextAlign.center,
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                title: Text(AppLocalizations.of(context)!.system),
                subtitle: Text(
                  AppLocalizations.of(context)!.followsPhoneSettings,
                ),
                value: ThemeMode.system,
                groupValue: widget.themeController.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    widget.themeController.setTheme(value);
                    Navigator.pop(context);
                  }
                },
              ),

              RadioListTile<ThemeMode>(
                title: Text(AppLocalizations.of(context)!.lightMode),
                value: ThemeMode.light,
                groupValue: widget.themeController.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    widget.themeController.setTheme(value);
                    Navigator.pop(context);
                  }
                },
              ),

              RadioListTile<ThemeMode>(
                title: Text(AppLocalizations.of(context)!.darkMode),
                value: ThemeMode.dark,
                groupValue: widget.themeController.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    widget.themeController.setTheme(value);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // =========================
        // Language Button
        // =========================
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.language),

            onPressed: _showLanguageDialog,
          ),
        ),

        // =========================
        // Title
        // =========================
        title: Text(
          AppLocalizations.of(context)!.hayaNomen,
          style: TextStyle(
            color: Color(0xFFB8860B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: const Color.fromARGB(255, 18, 143, 192),

        elevation: 0,

        surfaceTintColor: Colors.transparent,

        // =========================
        // Theme Button
        // =========================
        actions: [
          IconButton(
            tooltip: AppLocalizations.of(context)!.appAppearance,

            onPressed: _showThemeDialog,

            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),

              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },

              child: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,

                key: ValueKey(isDark),

                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      // =========================
      // Pages
      // =========================
      body: TabBarView(
        controller: _tabController,

        children: const [
          HomeIndex(),
          ListenAndLearnScreen(),
          Searchscreen(),
          AboutIndex(),
        ],
      ),

      // =========================
      // Bottom Navigation
      // =========================
      bottomNavigationBar: SafeArea(
        top: false,

        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),

          padding: const EdgeInsets.all(4),

          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF3FAFC),

            borderRadius: BorderRadius.circular(24),

            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black54 : const Color(0x240A5C6B),

                blurRadius: 18,

                offset: const Offset(0, 7),
              ),
            ],
          ),

          child: TabBar(
            controller: _tabController,

            dividerColor: Colors.transparent,

            indicatorSize: TabBarIndicatorSize.tab,

            indicator: BoxDecoration(
              color: const Color(0xFF167A8C),

              borderRadius: BorderRadius.circular(20),
            ),

            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 3,
            ),

            labelColor: const Color.fromARGB(255, 227, 189, 76),

            unselectedLabelColor: isDark
                ? Colors.white70
                : const Color(0xFF38616A),

            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),

            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),

            tabs: [
              Tab(
                text: AppLocalizations.of(context)!.home,
                icon: Icon(Icons.home_rounded),
                height: 60,
              ),

              Tab(
                text: AppLocalizations.of(context)!.listenAndLearn,
                icon: Icon(Icons.headphones_rounded),
                height: 60,
              ),

              Tab(
                text: AppLocalizations.of(context)!.search,
                icon: Icon(Icons.search),
                height: 60,
              ),

              Tab(
                text: AppLocalizations.of(context)!.aboutUs,
                icon: Icon(Icons.person_outline_rounded),
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
