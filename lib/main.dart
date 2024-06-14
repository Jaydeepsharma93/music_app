import 'package:flutter/material.dart';
import 'package:music_app/screens/mainHomescreen/homescreen.dart';
import 'package:music_app/screens/mainHomescreen/provider/pageindexProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => IndexProvider(),)
    ],child:const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
