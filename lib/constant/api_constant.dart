class ApiConstants {
    static const String baseUrl = 'https://api.quranpedia.net/v1';

  static const String mushafs = '/mushafs';

  static const String topics = '/topics';

  static const String reciters = '/reciters';

  static String mushaf(int mushafId) => '$mushafs/$mushafId';

  static String ayahs(int mushafId, int surahId, [int? ayahNumber]) =>
      ayahNumber == null
      ? '$mushafs/$mushafId/$surahId'
      : '$mushafs/$mushafId/$surahId/$ayahNumber';

  static String surahInformation(int surahId) => '/surah/information/$surahId';

  static String tafsirs(int surahId) => '/surah/tafsirs/$surahId';

  static String translations(int surahId, int ayahNumber, [String? language]) =>
      language == null
      ? '/translations/$surahId/$ayahNumber'
      : '/translations/$surahId/$ayahNumber/$language';

  static String translationBooks([String? languageCode]) => languageCode == null
      ? '/translation-books'
      : '/translation-books/$languageCode';

  static String translation(int bookId, int surahId, [int? ayahNumber]) =>
      ayahNumber == null
      ? '/translation/$bookId/$surahId'
      : '/translation/$bookId/$surahId/$ayahNumber';

  static String ayahBook(int surahId, int ayahNumber, int bookId) =>
      '/ayah/$surahId/$ayahNumber/book/$bookId';

  static String search(String query, {String? type}) => type == null
      ? '/search/${Uri.encodeComponent(query)}'
      : '/search/${Uri.encodeComponent(query)}/$type';
}
