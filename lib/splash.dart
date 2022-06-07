import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quicknews_app/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  // _storeSpalshScreen() async {
  //   int isViewed = 0;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('splashScreen', isViewed);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 124, 143, 248),
                Color.fromARGB(255, 181, 145, 238),
                Color.fromARGB(255, 119, 196, 232),
                // Color.fromARGB(221, 122, 122, 122),

                // Colors.blueAccent,
              ]),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/new1.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "images/newlogo.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedTextKit(animatedTexts: [
                    FadeAnimatedText("We Show News For You",
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w800)),
                    
                   
                  ])
                ],
              ),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black87,
        splashColor: Colors.green,
        onPressed: () async {
          //navigate directly to home page
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("showHome", true);
          // await _storeSpalshScreen();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Column(
          children: <Widget>[
            Icon(
              Icons.skip_next_rounded,
              size: 30,
            ),
            Text("Skip")
          ],
        ),
      ),
    );
  }
}
