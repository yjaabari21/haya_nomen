import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/network/quranpedia_service.dart';

class QuranReaderScreen extends StatefulWidget {
  const QuranReaderScreen({
    super.key,
    required this.title,
    this.mushafId = 1,
    this.translationBookId,
    this.tafsirBookId,
  });

  final String title;
  final int mushafId;
  final int? translationBookId;
  final int? tafsirBookId;

  @override
  State<QuranReaderScreen> createState() => _QuranReaderScreenState();
}

class _QuranReaderScreenState extends State<QuranReaderScreen> {
  static const List<String> _surahNames = [
    'الفاتحة',
    'البقرة',
    'آل عمران',
    'النساء',
    'المائدة',
    'الأنعام',
    'الأعراف',
    'الأنفال',
    'التوبة',
    'يونس',
    'هود',
    'يوسف',
    'الرعد',
    'إبراهيم',
    'الحجر',
    'النحل',
    'الإسراء',
    'الكهف',
    'مريم',
    'طه',
    'الأنبياء',
    'الحج',
    'المؤمنون',
    'النور',
    'الفرقان',
    'الشعراء',
    'النمل',
    'القصص',
    'العنكبوت',
    'الروم',
    'لقمان',
    'السجدة',
    'الأحزاب',
    'سبأ',
    'فاطر',
    'يس',
    'الصافات',
    'ص',
    'الزمر',
    'غافر',
    'فصلت',
    'الشورى',
    'الزخرف',
    'الدخان',
    'الجاثية',
    'الأحقاف',
    'محمد',
    'الفتح',
    'الحجرات',
    'ق',
    'الذاريات',
    'الطور',
    'النجم',
    'القمر',
    'الرحمن',
    'الواقعة',
    'الحديد',
    'المجادلة',
    'الحشر',
    'الممتحنة',
    'الصف',
    'الجمعة',
    'المنافقون',
    'التغابن',
    'الطلاق',
    'التحريم',
    'الملك',
    'القلم',
    'الحاقة',
    'المعارج',
    'نوح',
    'الجن',
    'المزمل',
    'المدثر',
    'القيامة',
    'الإنسان',
    'المرسلات',
    'النبأ',
    'النازعات',
    'عبس',
    'التكوير',
    'الإنفطار',
    'المطففين',
    'الإنشقاق',
    'البروج',
    'الطارق',
    'الأعلى',
    'الغاشية',
    'الفجر',
    'البلد',
    'الشمس',
    'الليل',
    'الضحى',
    'الشرح',
    'التين',
    'العلق',
    'القدر',
    'البينة',
    'الزلزلة',
    'العاديات',
    'القارعة',
    'التكاثر',
    'العصر',
    'الهمزة',
    'الفيل',
    'قريش',
    'الماعون',
    'الكوثر',
    'الكافرون',
    'النصر',
    'المسد',
    'الإخلاص',
    'الفلق',
    'الناس',
  ];

  final QuranpediaService _service = QuranpediaService();
  int _surahId = 1;
  late Future<_ReaderData> _readerFuture;

  @override
  void initState() {
    super.initState();
    _readerFuture = _loadReaderData();
  }

  Future<_ReaderData> _loadReaderData() async {
    final ayahs = await _service.getAyahs(
      mushafId: widget.mushafId,
      surahId: _surahId,
    );
    final sortedAyahs = List<Map<String, dynamic>>.from(ayahs)
      ..sort((a, b) {
        final aNumber = (a['number'] as int?) ?? 0;
        final bNumber = (b['number'] as int?) ?? 0;
        return aNumber.compareTo(bNumber);
      });

    final translations = widget.translationBookId == null
        ? const <Map<String, dynamic>>[]
        : await _service.getTranslation(
            bookId: widget.translationBookId!,
            surahId: _surahId,
          );
    return _ReaderData(ayahs: sortedAyahs, translations: translations);
  }

  void _changeSurah(int? value) {
    if (value == null || value == _surahId) return;
    setState(() {
      _surahId = value;
      _readerFuture = _loadReaderData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF17343A);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '﷽',
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.amiri(
                      color: isDark ? Colors.white : const Color(0xFF17343A),
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _surahNames[_surahId - 1],
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSansArabic(
                      color: isDark ? Colors.white : const Color(0xFF17343A),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: DropdownButtonFormField<int>(
                value: _surahId,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'اختر السورة',
                  prefixIcon: const Icon(Icons.menu_book_rounded),
                  filled: true,
                  fillColor: isDark ? const Color(0xFF1E2A2D) : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: List.generate(
                  114,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('${index + 1} - ${_surahNames[index]}'),
                    ),
                  ),
                ),
                onChanged: _changeSurah,
              ),
            ),
            Expanded(
              child: FutureBuilder<_ReaderData>(
                future: _readerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return _ReaderMessage(
                      icon: Icons.cloud_off_rounded,
                      message:
                          'تعذر تحميل السورة. تأكد من اتصال الإنترنت ثم أعد المحاولة.',
                      textColor: textColor,
                    );
                  }

                  final data = snapshot.data;
                  if (data == null || data.ayahs.isEmpty) {
                    return _ReaderMessage(
                      icon: Icons.menu_book_outlined,
                      message: 'لا تتوفر آيات لهذه السورة.',
                      textColor: textColor,
                    );
                  }

                  final isMushafMode =
                      widget.translationBookId == null &&
                      widget.tafsirBookId == null;
                  if (isMushafMode) {
                    return _MushafTextView(
                      ayahs: data.ayahs,
                      textColor: textColor,
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
                    itemCount: data.ayahs.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final ayah = data.ayahs[index];
                      final ayahNumber = ayah['number'] as int? ?? index + 1;
                      final translation = data.translationFor(ayahNumber);
                      return _AyahCard(
                        ayah: ayah,
                        translation: translation,
                        textColor: textColor,
                        onTap: () => _openAyahDetails(ayah, translation),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openAyahDetails(Map<String, dynamic> ayah, String? translation) {
    final ayahNumber = ayah['number'] as int? ?? 1;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _AyahDetailsSheet(
        ayahText: ayah['text']?.toString() ?? '',
        ayahNumber: ayahNumber,
        translation: translation,
        tafsirFuture: widget.tafsirBookId == null
            ? null
            : _service.getTafsir(
                bookId: widget.tafsirBookId!,
                surahId: _surahId,
                ayahNumber: ayahNumber,
              ),
      ),
    );
  }
}

class _MushafTextView extends StatelessWidget {
  const _MushafTextView({required this.ayahs, required this.textColor});
  final List<Map<String, dynamic>> ayahs;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final spans = <InlineSpan>[
      TextSpan(
        style: GoogleFonts.amiri(color: textColor, fontSize: 30, height: 1.5),
      ),
    ];

    for (final ayah in ayahs) {
      final number = ayah['number']?.toString() ?? '';
      spans.add(
        TextSpan(
          text: '${ayah['text']?.toString() ?? ''}  ',
          style: GoogleFonts.amiri(
            color: textColor,
            fontSize: 28,
            height: 2.15,
          ),
        ),
      );
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF5E8C7),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFB8860B), width: 1.2),
            ),
            child: Text(
              '۝',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF96700B),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
      spans.add(const TextSpan(text: '  '));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      child: SelectableText.rich(
        TextSpan(children: spans),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}

class _ReaderData {
  const _ReaderData({required this.ayahs, required this.translations});
  final List<Map<String, dynamic>> ayahs;
  final List<Map<String, dynamic>> translations;

  String? translationFor(int ayahNumber) {
    for (final translation in translations) {
      if (translation['ayah_number']?.toString() == ayahNumber.toString()) {
        final text =
            translation['translation_text'] ??
            translation['translation-content'] ??
            translation['text'];
        return text == null ? null : _stripHtml(text.toString());
      }
    }
    return null;
  }
}

String _stripHtml(String value) {
  return value
      .replaceAll(RegExp(r'<[^>]*>'), ' ')
      .replaceAll('&nbsp;', ' ')
      .replaceAll('&amp;', '&')
      .replaceAll('&quot;', '"')
      .replaceAll('&#39;', "'")
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

class _AyahCard extends StatelessWidget {
  const _AyahCard({
    required this.ayah,
    required this.translation,
    required this.textColor,
    required this.onTap,
  });
  final Map<String, dynamic> ayah;
  final String? translation;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final number = ayah['number']?.toString() ?? '';
    return Material(
      color: isDark ? const Color(0xFF1E2A2D) : Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5F5F7),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: const Color(0xFFB5D9DF),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '۝',
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      color: Color(0xFF007C8D),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                ayah['text']?.toString() ?? '',
                textAlign: TextAlign.right,
                style: GoogleFonts.amiri(
                  color: textColor,
                  fontSize: 27,
                  height: 1.9,
                ),
              ),
              if (translation != null) ...[
                const Divider(height: 26),
                Text(
                  translation!,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: isDark ? Colors.white70 : const Color(0xFF50666B),
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _AyahDetailsSheet extends StatelessWidget {
  const _AyahDetailsSheet({
    required this.ayahText,
    required this.ayahNumber,
    required this.translation,
    required this.tafsirFuture,
  });
  final String ayahText;
  final int ayahNumber;
  final String? translation;
  final Future<Map<String, dynamic>>? tafsirFuture;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF17343A);
    return SafeArea(
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.92,
        builder: (context, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'الآية $ayahNumber',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: GoogleFonts.ibmPlexSansArabic(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              ayahText,
              style: GoogleFonts.amiri(
                color: textColor,
                fontSize: 28,
                height: 1.9,
              ),
            ),
            if (translation != null) ...[
              const Divider(height: 30),
              Text(
                'الترجمة',
                style: GoogleFonts.ibmPlexSansArabic(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                translation!,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: textColor, fontSize: 16, height: 1.5),
              ),
            ],
            if (tafsirFuture != null) ...[
              const Divider(height: 30),
              Text(
                'التفسير',
                style: GoogleFonts.ibmPlexSansArabic(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              FutureBuilder<Map<String, dynamic>>(
                future: tafsirFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return const Center(child: CircularProgressIndicator());
                  if (snapshot.hasError)
                    return Text(
                      'تعذر تحميل التفسير.',
                      style: TextStyle(color: textColor),
                    );
                  final content = snapshot.data?['content'];
                  if (content is! List || content.isEmpty)
                    return Text(
                      'لا يتوفر تفسير لهذه الآية.',
                      style: TextStyle(color: textColor),
                    );
                  return Text(
                    content.map((item) => (item as Map)['text']).join('\n\n'),
                    style: GoogleFonts.ibmPlexSansArabic(
                      color: textColor,
                      fontSize: 16,
                      height: 1.7,
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ReaderMessage extends StatelessWidget {
  const _ReaderMessage({
    required this.icon,
    required this.message,
    required this.textColor,
  });
  final IconData icon;
  final String message;
  final Color textColor;
  @override
  Widget build(BuildContext context) => Center(
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
            ),
          ),
        ],
      ),
    ),
  );
}
