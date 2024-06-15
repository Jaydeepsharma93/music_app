import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_app/utils/songlist.dart';

class MusicProvider extends ChangeNotifier{
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  int currentIndex = 0;
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void playMusic(int index){
    currentIndex = index;
    _assetsAudioPlayer.open(
      Audio(songs[index]['song']),
      showNotification: false,
    );
    _isPlaying = true;
    notifyListeners();
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
}