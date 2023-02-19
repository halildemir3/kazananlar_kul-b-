import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:http/http.dart' as http;
import 'package:untitled53/about/about_screen.dart';
import 'package:untitled53/profile/profile_page.dart';

import '../colors.dart';
import '../constans.dart';

import '../macDetay/macDetay.dart';
import '../macDetay/macModel.dart';
import '../news_screen/news_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {}

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MatchPage(),
    NewsPage(),
    AboutPage(),
    ProfilePage(),
  ];
  List titles = ["Maçlar", "Spor Haberleri", "Hakkımızda", "Profil"];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround_Color,
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: backGround_Color,
        title: Text(
          titles[_selectedIndex],
          style: TextStyle(color: titleColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5, backgroundColor: backGround_Color,
        showSelectedLabels: false,
        enableFeedback: false,
        type: BottomNavigationBarType.fixed, showUnselectedLabels: false,

        //fixedColor: Colors.black87,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              homeIcon,
              color:
                  _selectedIndex == 0 ? selectedItemColor : unselectedItemColor,
              height: iconSize + 3,
              width: iconSize + 3,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              newsIcon,
              color:
                  _selectedIndex == 1 ? selectedItemColor : unselectedItemColor,
              height: iconSize,
              width: iconSize,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              aboutIcon,
              color:
                  _selectedIndex == 2 ? selectedItemColor : unselectedItemColor,
              height: iconSize,
              width: iconSize,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              profileIcon,
              color:
                  _selectedIndex == 3 ? selectedItemColor : unselectedItemColor,
              height: iconSize,
              width: iconSize,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
    );
  }
}

class MatchPage extends StatefulWidget {
  MatchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  void initState() {
    getPosts();
  }

  List<MacModel> posts = [];
  Future<List<MacModel>> getPosts() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var res = await http.post(
      Uri.parse(macUrl),
      headers: headers,
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      setState(() {
        posts = body
            .map(
              (dynamic item) => MacModel.fromJson(item),
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
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MacDetay(nesne: posts[index])));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: macItemColor,
                  ),
                  height: 100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "$baseUrl${posts[index].image}"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${posts[index].ev} & ${posts[index].dep}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${posts[index].stad}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${posts[index].tarih}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
