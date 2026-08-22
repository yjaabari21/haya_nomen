import 'package:flutter_test/flutter_test.dart';
import 'package:haya_nomen/widgets%20and%20screen/reciter_audio_screen.dart';

void main() {
  test('buildAudioUrlCandidates uses the selected surah in template URLs', () {
    final reciter = {'audio_url': 'https://example.com/audio/{surah}.mp3'};

    final urls = buildAudioUrlCandidates(reciter, 7);

    expect(urls, contains('https://example.com/audio/007.mp3'));
  });

  test(
    'buildAudioUrlCandidates appends surah number when server is a base URL',
    () {
      final reciter = {'audio_url': 'https://example.com/reciter'};

      final urls = buildAudioUrlCandidates(reciter, 12);

      expect(urls, contains('https://example.com/reciter/012.mp3'));
    },
  );
}
