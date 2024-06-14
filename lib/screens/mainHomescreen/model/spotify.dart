import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Column buildColumnspotify(double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: height * 0.015),
      Center(
        child: Image.asset('assets/img/spotify.png',
            height: 35, color: Colors.grey.shade700),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          "Popular Playlists",
          style:
              TextStyle(fontSize: height * 0.017, color: Colors.grey.shade700),
        ),
      ),
      SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(spotify[index]['img']))),
              ),
              Text(spotify[index]["name"])
            ],
          ),
          itemCount: spotify.length,
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          "Featured Charts",
          style:
              TextStyle(fontSize: height * 0.017, color: Colors.grey.shade700),
        ),
      ),
      SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(featured[index]['img']))),
              ),
              Text(featured[index]["name"])
            ],
          ),
          itemCount: featured.length,
        ),
      ),
    ],
  );
}

List spotify = [
  {'name': "Hot Hits Hindi", 'img': "assets/img/0.jpg"},
  {'name': "Hot Hits Punjabi", 'img': "assets/img/1.jpg"},
  {'name': "Bollywood Mush", 'img': "assets/img/2.jpg"},
  {'name': "Trending Now india", 'img': "assets/img/3.jpg"},
  {'name': "Bollywood Dance Music", 'img': "assets/img/4.jpg"},
  {'name': "All Out 00's Hindi", 'img': "assets/img/5.jpg"}
];
List featured = [
  {'name': "Top Songs - Global", 'img': "assets/img/01.png"},
  {'name': "Top Songs - India", 'img': "assets/img/02.png"},
];
