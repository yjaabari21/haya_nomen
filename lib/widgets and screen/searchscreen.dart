import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/network/quranpedia_service.dart';
import 'package:haya_nomen/widgets%20and%20screen/searchresultview.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  final QuranpediaService _service = QuranpediaService();
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _results = const [];
  bool _isSearching = false;
  bool _hasSearched = false;
  String? _error;

  Future<void> _search() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _isSearching = true;
      _hasSearched = true;
      _error = null;
    });
    try {
      final results = await _service.searchAll(query);
      if (!mounted) return;
      setState(() {
        _results = results;
        _isSearching = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _results = const [];
        _isSearching = false;
        _error = 'تعذر تنفيذ البحث. تحقق من الاتصال وحاول مرة أخرى.';
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF17343A);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark
            ? const Color(0xFF121212)
            : const Color(0xFFF6FBFC),
        appBar: AppBar(
          title: Text(
            'بحث شامل',
            style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: textColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _search(),
                decoration: InputDecoration(
                  hintText: 'ابحث في القرآن والتفاسير والكتب والفتاوى',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: IconButton(
                    tooltip: 'بحث',
                    onPressed: _search,
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  filled: true,
                  fillColor: isDark ? const Color(0xFF1E2A2D) : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: FilledButton.icon(
                onPressed: _isSearching ? null : _search,
                icon: _isSearching
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.search_rounded),
                label: Text(_isSearching ? 'جاري البحث...' : 'بحث'),
              ),
            ),
            Expanded(child: _buildResults(isDark, textColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildResults(bool isDark, Color textColor) {
    if (_isSearching) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return _EmptySearch(message: _error!);
    }
    if (!_hasSearched) {
      return const _EmptySearch(
        message: 'اكتب كلمة للبحث في محتوى Quranpedia.',
      );
    }
    if (_results.isEmpty) {
      return const _EmptySearch(message: 'لا توجد نتائج لهذا البحث.');
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: _results.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) => _SearchResultTile(
        result: _results[index],
        isDark: isDark,
        textColor: textColor,
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  const _SearchResultTile({
    required this.result,
    required this.isDark,
    required this.textColor,
  });

  final Map<String, dynamic> result;
  final bool isDark;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final title =
        result['title'] ??
        result['name'] ??
        result['ar_title'] ??
        result['ar_question'] ??
        result['note'] ??
        result['book'] ??
        result['fatwa'] ??
        result['topic'] ??
        result['question'] ??
        result['text'] ??
        'نتيجة بحث';
    final subtitle =
        result['description'] ??
        result['mufti'] ??
        result['ar_answer'] ??
        result['author'] ??
        result['type'] ??
        result['_type'];
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      tileColor: isDark ? const Color(0xFF1E2A2D) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: const CircleAvatar(
        backgroundColor: Color(0xFF167A8C),
        child: Icon(Icons.menu_book_rounded, color: Colors.white),
      ),
      title: Text(
        title.toString(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.ibmPlexSansArabic(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(_formatType(subtitle.toString())),
      trailing: const Icon(Icons.chevron_left_rounded),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Searchresultview(result: result)),
        );
      },
    );
  }

  String _formatType(String value) {
    const labels = {
      'books': 'كتاب',
      'fatwas': 'فتوى',
      'notes': 'ملاحظة',
      'topics': 'موضوع',
      'ayahs': 'آية',
    };
    return labels[value.toLowerCase()] ?? value;
  }
}

class _EmptySearch extends StatelessWidget {
  const _EmptySearch({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search_rounded, size: 44, color: Color(0xFF167A8C)),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
