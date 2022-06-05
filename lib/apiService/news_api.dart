import 'dart:convert';

import 'package:http/http.dart';
import 'package:quicknews_app/apiService/article_model.dart';

class NewsApi {
  //use of api url
  final url =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=3ce5c3023dc849dba79dd725ea8c613b";
//http request function

  Future<List<Article>> getArticle() async {
    Response resp = await get(Uri.parse(url));

    if (resp.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(resp.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("can't get the articles");
    }
  }
}
