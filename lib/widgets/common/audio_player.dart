import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class AudioPlayerWidget extends StatefulWidget {
  final String url;

  const AudioPlayerWidget({super.key, required this.url});

  @override
  AudioPlayerWidgetState createState() => AudioPlayerWidgetState();
}

class AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = const Duration();
  Duration position = const Duration();
  Source? source;
  Timer? timer;

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    // String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? '${duration.inHours}:' : ''}$twoDigitMinutes";
  }

  @override
  void initState() {
    super.initState();
    source = UrlSource(widget.url);
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        this.duration = duration;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        this.position = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (isPlaying) {
                  audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  audioPlayer.play(source!);
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ),
        StreamBuilder<Duration>(
          stream: audioPlayer.onPositionChanged,
          builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
            if (snapshot.hasData) {
              position = snapshot.data!;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.grey.shade100,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(formatDuration(
                          Duration(minutes: position.inSeconds))),
                      Slider(
                        value: position.inSeconds.toDouble(),
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            audioPlayer.seek(Duration(seconds: value.toInt()));
                            position = Duration(seconds: value.toInt());
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(formatDuration(
                          Duration(minutes: duration.inSeconds))),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
    timer?.cancel();
  }
}
