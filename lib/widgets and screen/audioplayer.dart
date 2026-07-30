import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlay extends StatefulWidget {
  const AudioPlay({super.key});

  @override
  State<AudioPlay> createState() => _AudioPlayState();
}

class _AudioPlayState extends State<AudioPlay> {
  final AudioPlayer player = AudioPlayer();

  Future<void> playAudio() async {
    try {
      await player.setAsset('lib/assets/audio/qeyama.mp3');
      await player.play();
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopAudio() async {
    await player.stop();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: playAudio,
          icon: const Icon(Icons.play_arrow, color: Colors.white),
          label: const Text("تشغيل", style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.green),
          ),
        ),

        const SizedBox(height: 8),

        ElevatedButton.icon(
          onPressed: stopAudio,
          icon: const Icon(Icons.stop, color: Colors.white),
          label: const Text("إيقاف", style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.red),
          ),
        ),
      ],
    );
  }
}
