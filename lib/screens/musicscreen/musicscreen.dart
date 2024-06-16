import 'package:flutter/material.dart';
import 'package:music_app/screens/mainHomescreen/provider/playmusicProvider.dart';
import 'package:music_app/utils/songlist.dart';
import 'package:provider/provider.dart';

class MusicsScreen extends StatelessWidget {
  const MusicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMusic =
        songs[Provider.of<MusicProvider>(context).currentIndex];
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.volume_up_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.graphic_eq_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(currentMusic['img']), fit: BoxFit.fill)),
          ),
          SizedBox(height: 25),
          Text(
            currentMusic['name'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            currentMusic['artist'],
            style: TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(height: 170),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.queue_music_outlined)),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
                IconButton(onPressed: () {}, icon: Icon(Icons.add))
              ],
            ),
          ),
          Slider(
            value: Provider.of<MusicProvider>(context).sliderValue,
            max: Provider.of<MusicProvider>(context).maxDuration > 0
                ? Provider.of<MusicProvider>(context).maxDuration
                : 1.0,
            onChanged: (value) {
              if(Provider.of<MusicProvider>(context,listen: false).maxDuration > 0){
                Provider.of<MusicProvider>(context,listen: false).seek(value);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
                IconButton(
                    onPressed: () {
                      int newIndex =
                          (Provider.of<MusicProvider>(context, listen: false)
                                      .currentIndex -
                                  1 +
                                  songs.length) %
                              songs.length;
                      Provider.of<MusicProvider>(context, listen: false)
                          .playMusic(newIndex);
                    },
                    icon: Icon(
                      Icons.skip_previous,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      if (Provider.of<MusicProvider>(context, listen: false)
                          .isPlaying) {
                        Provider.of<MusicProvider>(context, listen: false)
                            .pauseMusic();
                      } else {
                        Provider.of<MusicProvider>(context, listen: false)
                            .resumeMusic();
                      }
                    },
                    icon: Icon(
                      Provider.of<MusicProvider>(context).isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 35,
                    )),
                IconButton(
                    onPressed: () {
                      int newIndex =
                          (Provider.of<MusicProvider>(context, listen: false)
                                      .currentIndex +
                                  1) %
                              songs.length;
                      Provider.of<MusicProvider>(context, listen: false)
                          .playMusic(newIndex);
                    },
                    icon: Icon(
                      Icons.skip_next,
                      size: 30,
                    )),
                IconButton(onPressed: () {}, icon: Icon(Icons.repeat))
              ],
            ),
          )
        ],
      ),
    );
  }
}
