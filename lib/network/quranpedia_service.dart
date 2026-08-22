import 'api_client.dart';
import 'package:haya_nomen/constant/api_constant.dart';

/// خدمات البيانات التي تعرضها شاشة «اسمع وتعلّم» من Quranpedia.
class QuranpediaService {
  QuranpediaService({ApiClient? client}) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<List<Map<String, dynamic>>> getMushafs() =>
      _getList(ApiConstants.mushafs);

  Future<List<Map<String, dynamic>>> getTranslationBooks({
    String? languageCode,
  }) => _getList(ApiConstants.translationBooks(languageCode));

  Future<List<Map<String, dynamic>>> getReciters() async {
    final response = await _client.get(ApiConstants.reciters);
    if (response is! List) return const [];

    return response.expand<Map<String, dynamic>>((group) {
      if (group is Map) return [Map<String, dynamic>.from(group)];
      if (group is List) {
        return group.whereType<Map>().map(Map<String, dynamic>.from);
      }
      return const [];
    }).toList();
  }

  Future<List<Map<String, dynamic>>> searchAll(String query) async {
    final response = await _client.get(ApiConstants.search(query));
    if (response is List) {
      return response.whereType<Map>().map(Map<String, dynamic>.from).toList();
    }
    if (response is! Map) return const [];

    final results = <Map<String, dynamic>>[];
    void collect(dynamic value, [String? type]) {
      if (value is List) {
        for (final item in value) {
          collect(item, type);
        }
      } else if (value is Map) {
        final item = Map<String, dynamic>.from(value);
        if (type != null && !item.containsKey('_type')) item['_type'] = type;
        results.add(item);
      }
    }

    final data = response['data'] ?? response['results'] ?? response['items'];
    if (data is List) {
      collect(data);
    } else if (data is Map) {
      for (final entry in data.entries) {
        final section = entry.value;
        if (section is Map && section['items'] is List) {
          collect(section['items'], entry.key.toString());
        } else {
          collect(section, entry.key.toString());
        }
      }
    } else {
      for (final entry in response.entries) {
        final section = entry.value;
        if (section is Map && section['items'] is List) {
          collect(section['items'], entry.key.toString());
        } else if (section is List) {
          collect(section, entry.key.toString());
        }
      }
    }
    return results;
  }

  Future<List<Map<String, dynamic>>> getTafsirs({int surahId = 1}) =>
      _getList(ApiConstants.tafsirs(surahId));

  Future<List<Map<String, dynamic>>> getAyahs({
    int mushafId = 1,
    required int surahId,
  }) => _getList(ApiConstants.ayahs(mushafId, surahId));

  Future<List<Map<String, dynamic>>> getTranslation({
    required int bookId,
    required int surahId,
  }) => _getList(ApiConstants.translation(bookId, surahId));

  Future<Map<String, dynamic>> getTafsir({
    required int bookId,
    required int surahId,
    required int ayahNumber,
  }) async {
    final response = await _client.get(
      ApiConstants.ayahBook(surahId, ayahNumber, bookId),
    );
    return response is Map<String, dynamic>
        ? response
        : Map<String, dynamic>.from(response as Map);
  }

  Future<List<Map<String, dynamic>>> _getList(String path) async {
    final response = await _client.get(path);
    final list = response is List
        ? response
        : response is Map && response['data'] is List
        ? response['data'] as List
        : null;
    if (list == null) return const [];

    return list.whereType<Map>().map((item) {
      return Map<String, dynamic>.from(item);
    }).toList();
  }
}
