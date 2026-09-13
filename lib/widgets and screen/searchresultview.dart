import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/l10n/app_localizations.dart';

class Searchresultview extends StatelessWidget {
  const Searchresultview({super.key, required this.result});

  final Map<String, dynamic> result;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF17343A);
    final l10n = AppLocalizations.of(context)!;
    final title = _resultTitle(l10n);
    final type = _typeLabel(result['_type'] ?? result['type'], l10n);
    final bookInfo = result['book_info'];
    final entries = <MapEntry<String, dynamic>>[
      if (bookInfo is Map)
        ...bookInfo.entries.map(
          (entry) =>
              MapEntry<String, dynamic>(entry.key.toString(), entry.value),
        ),
      ...result.entries.where((entry) => entry.key != 'book_info'),
    ];
    final detailEntries = entries
        .where(
          (entry) =>
              entry.key != '_type' &&
              entry.key != 'title' &&
              entry.key != 'name' &&
              !_isHiddenField(entry.key) &&
              entry.value != null,
        )
        .where((entry) => _readableValue(entry.value).trim().isNotEmpty)
        .toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: isDark
              ? const Color(0xFF121212)
              : const Color(0xFFF6FBFC),
          appBar: AppBar(
            title: Text(
              '',
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: textColor,
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0097A7), Color(0xFF006C78)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.auto_stories_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            type,
                            style: GoogleFonts.ibmPlexSansArabic(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      title,
                      style: GoogleFonts.ibmPlexSansArabic(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Text(
                l10n.resultContent,
                style: GoogleFonts.ibmPlexSansArabic(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...detailEntries.map(
                (entry) => _DetailField(
                  label: _fieldLabel(entry.key),
                  value: _readableValue(entry.value),
                  isDark: isDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _resultTitle(AppLocalizations l10n) {
    final bookInfo = result['book_info'];
    if (bookInfo is Map && _hasText(bookInfo['name'])) {
      return bookInfo['name'].toString();
    }

    for (final key in const [
      'title',
      'name',
      'ar_title',
      'ar_question',
      'note',
      'book',
      'fatwa',
      'topic',
      'question',
      'ar_answer',
      'text',
    ]) {
      final value = result[key];
      if (_hasText(value)) return value.toString();
      if (value is Map) {
        for (final nestedKey in const ['name', 'title', 'ar_name', 'e']) {
          if (_hasText(value[nestedKey])) return value[nestedKey].toString();
        }
      }
    }
    return l10n.searchResult;
  }

  bool _hasText(Object? value) => value is String && value.trim().isNotEmpty;

  String _typeLabel(Object? value, AppLocalizations l10n) {
    final labels = {
      'books': l10n.book,
      'fatwas': l10n.fatwa,
      'notes': l10n.note,
      'topics': l10n.topic,
      'ayahs': l10n.ayah,
    };
    return labels[value?.toString().toLowerCase()] ?? l10n.resultDetails;
  }

  String _fieldLabel(String key) {
    const labels = {
      'note': 'النص',
      'book': 'الكتاب',
      'fatwa': 'الفتوى',
      'topic': 'الموضوع',
      'question': 'السؤال',
      'ar_title': 'العنوان',
      'ar_question': 'السؤال',
      'ar_answer': 'الإجابة',
      'answer': 'الإجابة',
      'description': 'الوصف',
      'author': 'الكاتب',
      'writer': 'المؤلف',
      'inspector': 'المحقق',
      'parts': 'الأجزاء',
      'ayahs': 'الآيات',
      'category': 'التصنيف',
      'source': 'المصدر',
      'language': 'اللغة',
      'content': 'المحتوى',
      'type': 'النوع',
      'book_info': 'بيانات الكتاب',
      'highlighted_text': 'مقتطف من المحتوى',
      'contents_url': 'رابط المحتوى',
      'publish_year': 'سنة النشر',
      'edition': 'الطبعة',
      'nasher': 'الناشر',
      'mufti': 'المفتي',
      'ar_name': 'الاسم العربي',
      'name': 'الاسم',
      'ar_source_url': 'المصدر',
    };
    return labels[key.toLowerCase()] ?? key.replaceAll('_', ' ');
  }

  bool _isHiddenField(String key) {
    final normalizedKey = key.toLowerCase();
    return normalizedKey == 'id' ||
        normalizedKey == 'attachments' ||
        normalizedKey == 'highlighted_text' ||
        normalizedKey == 'has_image' ||
        normalizedKey == 'contents_url' ||
        normalizedKey == 'about' ||
        normalizedKey.endsWith('_id');
  }

  String _readableValue(Object? value) {
    if (value == null) return '';
    if (value is Map) {
      return value.entries
          .where((entry) => !_isHiddenField(entry.key.toString()))
          .map(
            (entry) =>
                '${_fieldLabel(entry.key.toString())}: ${_readableValue(entry.value)}',
          )
          .join('\n');
    }
    if (value is List) {
      return value.map((item) => _readableValue(item)).join('\n');
    }
    return value.toString();
  }
}

class _DetailField extends StatelessWidget {
  const _DetailField({
    required this.label,
    required this.value,
    required this.isDark,
  });

  final String label;
  final String value;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2A2D) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFE1EFF1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.segment_rounded,
                size: 19,
                color: Color(0xFF167A8C),
              ),
              const SizedBox(width: 7),
              Text(
                label,
                style: GoogleFonts.ibmPlexSansArabic(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF167A8C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          SelectableText(
            value,
            style: GoogleFonts.ibmPlexSansArabic(fontSize: 16, height: 1.75),
          ),
        ],
      ),
    );
  }
}
