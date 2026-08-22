import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

String? findAudioSource(dynamic value) {
  if (value is String && value.startsWith('http')) return value;
  if (value is Map) {
    for (final key in const [
      'audio_url',
      'audio_server',
      'server_url',
      'server',
      'url',
    ]) {
      final source = value[key];
      if (source is String && source.startsWith('http')) return source;
    }
    for (final key in const ['audio_servers', 'servers', 'audio']) {
      final source = findAudioSource(value[key]);
      if (source != null) return source;
    }
    for (final entry in value.entries) {
      final key = entry.key.toString().toLowerCase();
      if (key.contains('timing')) continue;
      if (key.contains('audio') ||
          key.contains('server') ||
          key.contains('url')) {
        final source = findAudioSource(entry.value);
        if (source != null) return source;
      }
    }
  }
  if (value is List) {
    for (final item in value) {
      final source = findAudioSource(item);
      if (source != null) return source;
    }
  }
  return null;
}

List<String> buildAudioUrlCandidates(dynamic reciter, int surahId) {
  final candidate = findAudioSource(reciter);
  if (candidate == null || candidate.isEmpty) return const [];

  final number = surahId.toString().padLeft(3, '0');
  final cleaned = candidate.trim();
  final variants = <String>{};

  void addCandidate(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    variants.add(trimmed);
  }

  String replaceToken(String value) {
    final tokenPatterns = [
      '{surah}',
      '{sura}',
      '{number}',
      '{sura_number}',
      '{surah_number}',
    ];
    var result = value;
    for (final token in tokenPatterns) {
      if (result.contains(token)) {
        result = result.replaceAll(token, number);
      }
    }
    return result;
  }

  final withToken = replaceToken(cleaned);
  addCandidate(withToken);

  final numberedPattern = RegExp(
    r'\d+(?=(?:\.mp3|\.m4a|\.aac|\.mp4)(?:\?.*)?$)',
  );
  if (numberedPattern.hasMatch(cleaned)) {
    addCandidate(cleaned.replaceFirst(numberedPattern, number));
  }

  final baseWithoutTrailingSlash = cleaned.replaceFirst(RegExp(r'/+$'), '');
  final baseUrl = baseWithoutTrailingSlash.replaceFirst(
    RegExp(r'(?<=\d)(?=\.(mp3|m4a|aac|mp4)(?:\?.*)?$)'),
    '',
  );

  final fileBase = baseUrl.contains(RegExp(r'\.(mp3|m4a|aac|mp4)(?:\?.*)?$'))
      ? baseUrl.replaceFirst(RegExp(r'\.(mp3|m4a|aac|mp4)(?:\?.*)?$'), '')
      : baseUrl;

  addCandidate('$baseWithoutTrailingSlash/$number.mp3');
  addCandidate('$baseWithoutTrailingSlash/$number.m4a');
  addCandidate('$fileBase$number.mp3');
  addCandidate('$fileBase$number.m4a');

  if (cleaned.contains('?')) {
    final withQueryNumber = cleaned.replaceFirst(
      RegExp(r'(surah|sura|number)=(\d+|\{surah\}|\{sura\}|\{number\})'),
      'surah=$number',
    );
    addCandidate(withQueryNumber);
  }

  if (cleaned.endsWith('.mp3') || cleaned.endsWith('.m4a')) {
    addCandidate(cleaned);
  }

  return variants.toList();
}

class ReciterAudioScreen extends StatefulWidget {
  const ReciterAudioScreen({super.key, required this.reciter});
  final Map<String, dynamic> reciter;

  @override
  State<ReciterAudioScreen> createState() => _ReciterAudioScreenState();
}

class _ReciterAudioScreenState extends State<ReciterAudioScreen> {
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
    ' الحديد',
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
    'المudadد',
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

  final AudioPlayer _player = AudioPlayer();
  late final StreamSubscription<PlayerState> _playerStateSubscription;
  int _surahId = 1;
  bool _isLoading = false;
  bool _isPlaying = false;
  String? _error;
  String? _loadedUrl;

  @override
  void initState() {
    super.initState();
    _playerStateSubscription = _player.playerStateStream.listen((state) {
      if (mounted) setState(() => _isPlaying = state.playing);
    });
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    _player.dispose();
    super.dispose();
  }

  Future<void> _togglePlayback() async {
    if (_isPlaying) {
      await _player.pause();
      return;
    }

    final candidates = buildAudioUrlCandidates(widget.reciter, _surahId);
    if (candidates.isEmpty) {
      setState(() => _error = 'لا يتوفر رابط صوتي لهذا القارئ من الخدمة.');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    bool played = false;
    for (final url in candidates) {
      try {
        final shouldReloadSource =
            _loadedUrl != url ||
            _player.processingState == ProcessingState.idle ||
            _player.processingState == ProcessingState.completed;

        if (shouldReloadSource) {
          await _player.setUrl(url);
          _loadedUrl = url;
        }

        if (_player.processingState == ProcessingState.ready ||
            _player.processingState == ProcessingState.buffering) {
          await _player.play();
          played = true;
          break;
        }
      } catch (_) {
        continue;
      }
    }

    if (!played) {
      if (mounted) {
        setState(() => _error = 'تعذر تشغيل التلاوة. حاول مرة أخرى لاحقًا.');
      }
    }

    if (mounted) setState(() => _isLoading = false);
  }

  Future<void> _changeSurah(int value) async {
    _loadedUrl = null;
    _error = null;
    _isPlaying = false;
    await _player.stop();
    if (mounted) {
      setState(() => _surahId = value);
    }
  }

  String? buildAudioUrlForReciter(dynamic reciter, int surahId) {
    final candidates = buildAudioUrlCandidates(reciter, surahId);
    return candidates.isEmpty ? null : candidates.first;
  }

  String? _audioUrlFor(int surahId) =>
      buildAudioUrlForReciter(widget.reciter, surahId);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF17343A);
    final name = widget.reciter['name']?.toString() ?? 'قارئ';
    final type = (widget.reciter['recitation_type'] as Map?)?['ar_name']
        ?.toString();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('القراءة الصوتية')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFFE5F5F7),
                    child: Icon(
                      Icons.headphones_rounded,
                      color: Color(0xFF007C8D),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.ibmPlexSansArabic(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (type != null)
                          Text(
                            type,
                            style: GoogleFonts.ibmPlexSansArabic(
                              color: textColor.withValues(alpha: 0.7),
                              fontSize: 14,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              DropdownButtonFormField<int>(
                value: _surahId,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'اختر السورة',
                  prefixIcon: const Icon(Icons.library_books_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                items: List.generate(
                  114,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1} - ${_surahNames[index]}'),
                  ),
                ),
                onChanged: (value) async {
                  if (value == null) return;
                  await _changeSurah(value);
                },
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _isLoading ? null : _togglePlayback,
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        _isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                      ),
                label: Text(_isPlaying ? 'إيقاف مؤقت' : 'تشغيل التلاوة'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 16,
                  ),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(
                  _error!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ibmPlexSansArabic(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 15,
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
