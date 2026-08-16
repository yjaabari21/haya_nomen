import 'package:flutter/material.dart';
import 'package:haya_nomen/aboutindex.dart';
import 'package:haya_nomen/homeindex.dart';
import 'package:haya_nomen/theme_controller.dart';
import 'package:haya_nomen/widgets%20and%20screen/searchscreen.dart';

class TabsBar extends StatefulWidget {
  final ThemeController themeController;

  const TabsBar({super.key, required this.themeController});

  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // =========================
  // Theme Dialog
  // =========================

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('مظهر التطبيق', textAlign: TextAlign.center),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                title: const Text('النظام'),
                subtitle: const Text('يتبع إعدادات الهاتف'),
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
                title: const Text('الوضع الفاتح'),
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
                title: const Text('الوضع الداكن'),
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

            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'ميزة الترجمة قيد التطوير',
                    style: TextStyle(
                      color: Color.fromARGB(255, 233, 181, 24),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.blue,
                ),
              );
            },
          ),
        ),

        // =========================
        // Title
        // =========================
        title: const Text(
          'هيا نؤمن',
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
            tooltip: 'مظهر التطبيق',

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

        children: const [HomeIndex(), SearchScreen(), AboutIndex()],
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

            tabs: const [
              Tab(text: 'الرئيسية', icon: Icon(Icons.home_rounded), height: 60),

              Tab(text: 'البحث', icon: Icon(Icons.search_rounded), height: 60),

              Tab(
                text: 'من نحن',
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
