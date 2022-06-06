import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quicknews_app/apiService/article_model.dart';
import 'package:quicknews_app/apiService/news_api.dart';
import 'package:quicknews_app/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsApi client = NewsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 124, 143, 248),
        title: Text("Breaking News"),
        actions: [
          IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', false);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SplashScreen()));
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;

              return ListView.builder(
                  itemCount: articles?.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                          articles![index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        subtitle: Text(
                          articles[index].description,
                          style: TextStyle(fontSize: 10),
                        ),
                        leading: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(articles[index].urlToImage),
                        ),
                      ));
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }),
    );
  }
}
