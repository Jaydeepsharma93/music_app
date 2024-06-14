import 'package:flutter/cupertino.dart';

Column buildColumnfavourites(double height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'No favourites',
        style:
        TextStyle(fontSize: height * 0.025, fontWeight: FontWeight.w400),
      )
    ],
  );
}