import 'package:flutter/cupertino.dart';

Column buildColumnplaylists(double height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Create some playlists, and they'll appear here.",
        style: TextStyle(fontSize: height * 0.018),
      )
    ],
  );
}