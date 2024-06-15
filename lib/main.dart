import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/mainHomescreen/homescreen.dart';
import 'package:music_app/screens/mainHomescreen/provider/pageindexProvider.dart';
import 'package:music_app/screens/mainHomescreen/provider/playmusicProvider.dart';
import 'package:music_app/screens/settingScreen/themeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MusicProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: Provider.of<ThemeProvider>(context).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.grey.shade200,
          colorScheme: ColorScheme.light(secondary: Colors.white)),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.dark(secondary: Colors.grey.shade900)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
