import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/mainHomescreen/provider/pageindexProvider.dart';
import 'package:provider/provider.dart';
import 'model/favourite.dart';
import 'model/playlists.dart';
import 'model/slideroftypes.dart';
import 'model/spotify.dart';
import 'model/toprow.dart';

double height = 0;
double width = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List screens = [
      buildColumnspotify(height),
      buildColumnfavourites(height),
      Container(),
      Container(),
      buildColumnplaylists(height),
    ];
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.015),
            buildRow(width, height, context),
            buildCarouselSlider(height, context),
            Expanded(
              child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: screens[Provider.of<IndexProvider>(context).Index]),
            ),
          ],
        ),
      ),
    );
  }
}
