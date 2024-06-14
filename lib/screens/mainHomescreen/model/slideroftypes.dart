import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../provider/pageindexProvider.dart';

CarouselSlider buildCarouselSlider(double height, BuildContext context) {
  return CarouselSlider.builder(
    itemCount: 5,
    itemBuilder: (context, index, realIndex) => Center(
      child: Text(
        slider[index],
        style: TextStyle(
            fontSize: (index == Provider.of<IndexProvider>(context).Index)
                ? height * 0.026
                : height * 0.018,
            fontWeight: (index == Provider.of<IndexProvider>(context).Index)
                ? FontWeight.w500
                : FontWeight.w400),
      ),
    ),
    options: CarouselOptions(
      onPageChanged: (index, reason) {
        Provider.of<IndexProvider>(context, listen: false).onChangeIndex(index);
      },
      height: height * 0.07,
      viewportFraction: 0.28,
      animateToClosest: true,
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
    ),
  );
}

List slider = ['Spotify', 'Favourites', 'All Music', 'Albums', 'Playlists'];
