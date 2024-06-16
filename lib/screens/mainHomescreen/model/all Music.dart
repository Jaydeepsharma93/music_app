import 'package:flutter/material.dart';
import 'package:music_app/screens/mainHomescreen/provider/playmusicProvider.dart';
import 'package:music_app/screens/musicscreen/musicscreen.dart';
import 'package:music_app/utils/songlist.dart';
import 'package:provider/provider.dart';

class AllMusic extends StatelessWidget {
  const AllMusic({super.key});

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
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
              IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow))
            ],
          ),
        ),
        SizedBox(
          height: 750,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: songs.length,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  onTap: () {
                    Provider.of<MusicProvider>(context,listen: false).playMusic(index);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicsScreen()));
                  },
                  leading: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(songs[index]['img']),
                            fit: BoxFit.fill)),
                  ),
                  title: Text(
                    songs[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  subtitle: Text(songs[index]['artist']),
                  trailing: Icon(Icons.more_vert),
                ),
                Divider(
                  thickness: 0.5,
                  indent: 85,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
