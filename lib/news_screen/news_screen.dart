import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:untitled53/news_screen/newsModel.dart';

import '../constans.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    getPosts();
  }

  List<NewsModel> posts = [];
  Future<List<NewsModel>> getPosts() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var res = await http.post(
      Uri.parse(newsUrl),
      headers: headers,
    );
    // ;

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      setState(() {
        posts = body
            .map(
              (dynamic item) => NewsModel.fromJson(item),
            )
            .toList();
      });

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Padding(
        padding: padding,
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: paddingVertical,
                child: Container(
                  padding: padding,
                  decoration: style,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${posts[index].title}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage("$baseUrl${posts[index].image}"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        width: double.maxFinite,
                        height: 200,
                      ),
                      Text(
                        "${posts[index].content}",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
