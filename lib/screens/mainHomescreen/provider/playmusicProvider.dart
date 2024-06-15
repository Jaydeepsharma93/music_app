import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_app/utils/songlist.dart';

class MusicProvider extends ChangeNotifier{

  void playMusic(index){
    AssetsAudioPlayer.newPlayer().open(
      Audio(songs[index]['song']),
      autoStart: true
    );
    notifyListeners();
  }
}