import 'package:flutter/material.dart';
import 'package:quicknews_app/home.dart';
import 'package:quicknews_app/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;

  prefs.setBool("showHome", true);
  
  runApp(QuickNews(showHome: showHome));
}

class QuickNews extends StatelessWidget {
  final bool showHome;
  const QuickNews({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showHome ? HomeScreen() : SplashScreen(),
    );
  }
}
