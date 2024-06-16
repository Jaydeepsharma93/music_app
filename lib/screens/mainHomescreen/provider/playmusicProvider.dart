import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_app/utils/songlist.dart';

class MusicProvider extends ChangeNotifier {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  int currentIndex = 0;
  bool _isPlaying = false;
  double _sliderValue = 0.0;
  double _maxDuration = 0.0;

  double get sliderValue => _sliderValue;

  double get maxDuration => _maxDuration;

  bool get isPlaying => _isPlaying;

  void playMusic(int index) {
    currentIndex = index;
    _assetsAudioPlayer.open(
      Audio(songs[index]['song']),
      showNotification: false,
    );
    _isPlaying = true;
    notifyListeners();

    log(songs[currentIndex]['song']);

    _assetsAudioPlayer.currentPosition.listen((Duration position) {
      if (_maxDuration != 0.0) {
        _sliderValue = position.inSeconds.toDouble();
        notifyListeners();
      }
    });

    _assetsAudioPlayer.current.listen((Playing? playing) {
      if (playing != null) {
        final duration = playing.audio.duration;
        _maxDuration = duration.inSeconds.toDouble();
        notifyListeners();
      }
    });
  }

  void seek(double seconds) {
    _assetsAudioPlayer.seek(Duration(seconds: seconds.toInt()));
  }

  void pauseMusic() {
    _assetsAudioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resumeMusic() {
    _assetsAudioPlayer.play();
    _isPlaying = true;
    notifyListeners();
  }

  void stopMusic() {
    _assetsAudioPlayer.stop();
    _isPlaying = false;
    notifyListeners();
  }
}
