import 'package:flutter/material.dart';
import 'package:music_app/utils/songlist.dart';
import 'package:provider/provider.dart';

import '../provider/playmusicProvider.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sort,
                    color: Colors.grey.shade600,
                  )),
              Text(
                'Name',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 750,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            shrinkWrap: true,
            itemCount: songs.length,
            itemBuilder: (context, index) => Column(
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<MusicProvider>(context,listen: false).playMusic(index);
                  },
                  child: Container(
                    height: 184,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(songs[index]['img']),fit: BoxFit.fill
                      )
                    ),
                  ),
                ),
                Text(songs[index]['name'],style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),),
                Text(songs[index]['artist'],style: TextStyle(color: Colors.grey.shade600),)
              ],
            )
          ),
        )
      ],
    );
  }
}
