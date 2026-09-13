import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/l10n/app_localizations.dart';
import 'package:haya_nomen/network/quranpedia_service.dart';
import 'package:haya_nomen/widgets%20and%20screen/quran_reader_screen.dart';
import 'package:haya_nomen/widgets%20and%20screen/reciter_audio_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ListenAndLearnScreen extends StatelessWidget {
  const ListenAndLearnScreen({super.key});

  static final QuranpediaService _quranpedia = QuranpediaService();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF17343A);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: isDark
              ? const Color(0xFF121212)
              : const Color(0xFFF6FBFC),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0097A7), Color(0xFF006C78)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.listenAndLearn,
                              style: GoogleFonts.ibmPlexSansArabic(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l10n.listenDescription,
                              style: GoogleFonts.ibmPlexSansArabic(
                                color: Colors.white.withValues(alpha: 0.88),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  131,
                                  15,
                                  15,
                                ),
                              ),
                              onPressed: () => launchUrl(
                                Uri.parse('https://api.quranpedia.net/'),
                              ),
                              label: Text(
                                l10n.dataSource,
                                style: GoogleFonts.ibmPlexSansArabic(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              icon: Icon(
                                Icons.source_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E2A2D) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const BoxDecoration(
                      color: Color(0xFF167A8C),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: isDark
                        ? const Color.fromARGB(255, 145, 127, 23)
                        : Color(0xFF167A8C),
                    tabs: [
                      Tab(
                        text: l10n.readings,
                        icon: Icon(Icons.headphones_rounded),
                      ),
                      Tab(
                        text: l10n.translations,
                        icon: Icon(Icons.translate_rounded),
                      ),
                      Tab(
                        text: l10n.audio,
                        icon: Icon(Icons.volume_up_rounded),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: TabBarView(
                    children: [
                      _ApiCollection(
                        title: l10n.mushafReadings,
                        description: l10n.chooseRecitation,
                        future: _quranpedia.getMushafs(),
                        emptyHint: l10n.noReadings,
                        icon: Icons.menu_book_rounded,
                        textColor: textColor,
                        itemBuilder: (item) => _ApiItem(
                          icon: Icons.menu_book_rounded,
                          title: item['name']?.toString() ?? l10n.mushaf,
                          subtitle:
                              ((item['rawi'] as Map?)?['full_name'] ??
                                      item['description'])
                                  ?.toString() ??
                              '',
                          textColor: textColor,
                          onTap: () => _openReader(
                            context,
                            title: item['name']?.toString() ?? l10n.mushaf,
                            mushafId: item['id'] as int? ?? 1,
                          ),
                        ),
                      ),
                      _ApiCollection(
                        title: l10n.translationBooks,
                        description: l10n.browseTranslations,
                        future: _quranpedia.getTranslationBooks(),
                        emptyHint: l10n.noTranslations,
                        icon: Icons.translate_rounded,
                        textColor: textColor,
                        itemBuilder: (item) => _ApiItem(
                          icon: Icons.translate_rounded,
                          title: item['name']?.toString() ?? l10n.translation,
                          subtitle:
                              ((item['language'] as Map?)?['local_name'] ??
                                      item['card'])
                                  ?.toString() ??
                              '',
                          textColor: textColor,
                          onTap: () => _openReader(
                            context,
                            title:
                                item['name']?.toString() ??
                                l10n.translationMeaning,
                            translationBookId: item['id'] as int?,
                          ),
                        ),
                      ),
                      _ApiCollection(
                        title: l10n.audioReadings,
                        description: l10n.chooseReciter,
                        future: _quranpedia.getReciters(),
                        emptyHint: l10n.noAudioReadings,
                        icon: Icons.headphones_rounded,
                        textColor: textColor,
                        itemBuilder: (item) => _ApiItem(
                          icon: Icons.headphones_rounded,
                          title: item['name']?.toString() ?? l10n.reciter,
                          subtitle:
                              ((item['recitation_type'] as Map?)?['ar_name'] ??
                                      (item['rawi'] as Map?)?['name'])
                                  ?.toString() ??
                              '',
                          textColor: textColor,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ReciterAudioScreen(reciter: item),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openReader(
    BuildContext context, {
    required String title,
    int mushafId = 1,
    int? translationBookId,
    int? tafsirBookId,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuranReaderScreen(
          title: title,
          mushafId: mushafId,
          translationBookId: translationBookId,
          tafsirBookId: tafsirBookId,
        ),
      ),
    );
  }
}

class _ApiCollection extends StatelessWidget {
  const _ApiCollection({
    required this.title,
    required this.description,
    required this.future,
    required this.emptyHint,
    required this.icon,
    required this.textColor,
    required this.itemBuilder,
  });

  final String title;
  final String description;
  final Future<List<Map<String, dynamic>>> future;
  final String emptyHint;
  final IconData icon;
  final Color textColor;
  final Widget Function(Map<String, dynamic>) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return _ApiMessage(
            icon: Icons.cloud_off_rounded,
            message: AppLocalizations.of(context)!.loadDataError,
            textColor: textColor,
          );
        }

        final items = snapshot.data ?? const [];
        if (items.isEmpty) {
          return _ApiMessage(
            icon: icon,
            message: emptyHint,
            textColor: textColor,
          );
        }

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          children: [
            Text(
              title,
              style: GoogleFonts.ibmPlexSansArabic(
                color: textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: GoogleFonts.ibmPlexSansArabic(
                color: isDark ? Colors.white70 : const Color(0xFF5B7378),
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 16),
            ...items.map(itemBuilder),
          ],
        );
      },
    );
  }
}

class _ApiMessage extends StatelessWidget {
  const _ApiMessage({
    required this.icon,
    required this.message,
    required this.textColor,
  });
  final IconData icon;
  final String message;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF0097A7)),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSansArabic(
                color: textColor,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ApiItem extends StatelessWidget {
  const _ApiItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.textColor,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2A2D) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFE5F5F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF007C8D)),
        ),
        title: Text(
          title,
          style: GoogleFonts.ibmPlexSansArabic(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        subtitle: subtitle.isEmpty
            ? null
            : Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.ibmPlexSansArabic(
                  color: isDark ? Colors.white60 : const Color(0xFF5B7378),
                  fontSize: 13,
                ),
              ),
      ),
    );
  }
}

class _SectionContent extends StatelessWidget {
  const _SectionContent({
    required this.title,
    required this.description,
    required this.hint,
    required this.icon,
    required this.textColor,
    required this.cards,
  });
  final String title, description, hint;
  final IconData icon;
  final Color textColor;
  final List<_FeatureCardData> cards;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      children: [
        Text(
          title,
          style: GoogleFonts.ibmPlexSansArabic(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: GoogleFonts.ibmPlexSansArabic(
            color: isDark ? Colors.white70 : const Color(0xFF5B7378),
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 16),
        ...cards.map(
          (card) => _FeatureCard(
            data: card,
            color: isDark ? const Color(0xFF1E2A2D) : Colors.white,
            textColor: textColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF17343A) : const Color(0xFFE7F5F7),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF0097A7), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hint,
                  style: GoogleFonts.ibmPlexSansArabic(
                    color: textColor,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.data,
    required this.color,
    required this.textColor,
  });
  final _FeatureCardData data;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFE5F5F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(data.icon, color: const Color(0xFF007C8D)),
        ),
        title: Text(
          data.title,
          style: GoogleFonts.ibmPlexSansArabic(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          data.subtitle,
          style: GoogleFonts.ibmPlexSansArabic(
            color: const Color(0xFF5B7378),
            fontSize: 13,
          ),
        ),
        trailing: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
      ),
    );
  }
}

class _FeatureCardData {
  const _FeatureCardData(this.title, this.subtitle, this.icon);
  final String title, subtitle;
  final IconData icon;
}
