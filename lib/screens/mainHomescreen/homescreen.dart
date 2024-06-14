import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/playlists.dart';
import 'model/slideroftypes.dart';
import 'model/spotify.dart';
import 'model/toprow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.015),
            buildRow(width, height),
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
                  child: Column(
                    children: [

                    ],
                  )
                  // buildColumnplaylists(height)
                  // buildColumnspotify(height),
                  ),
            ),
          ],
        ),
      ),
    );
  }


}
