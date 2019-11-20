import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/screens/news_detail_screen.dart';
import 'components/chose_topic.dart';
import 'components/featured_articales.dart';
import 'components/for_you.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'helper/http.dart';
import 'components/news_list.dart';

void main() {
  return runApp(MaterialApp(
    title: 'Econnomist Dubai',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MainScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/newsdetail': (context) => NewsDetail(),
    },
  ));
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _opacity = 0.0;
  bool _change = false;
  ScrollController _scrollController;
  AppBar _appBar;
  FloatingActionButton fab;
  List<NewsList> list = [];
  int limit = 12;
  @override
  initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    buildNewsList();
    _appBar = null;
  }

  _scrollListener() {
//      print(_scrollController.position.axisDirection);
//      print(_scrollController.offset);
//    print(_scrollController.position.maxScrollExtent);
    if (_scrollController.position.axisDirection == AxisDirection.down) {
      if (_scrollController.offset >
          _scrollController.position.maxScrollExtent / 2) {
        print('half way reached');
        updateNewsList();
      } else if (_scrollController.offset > 20) {
        setState(() {
          _appBar = AppBar(
            backgroundColor: Color(0xFFEEF0F9),
            elevation: 0.0,
            leading: Padding(padding:EdgeInsets.only(left: 25.0),child: Icon(Icons.search,color: Color(0xFF26325B),
              size: 30.0,)),
            title: Text(
              'Lates News',
              style: kTitle.copyWith(fontSize: 25.0),
            ),
            actions: <Widget>[
              Hero(
                tag: 'icon',
                child: Padding(
                  padding: const EdgeInsets.only(right:25.0),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.account_circle,

                    ),
                  ),
                ),
              )
            ],
          );
          fab = FloatingActionButton(
            onPressed: (){
               _scrollController.position.jumpTo(0);
            },
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_upward,color: Color(0xFF26325B),),
          );

        });
      } else if (_scrollController.offset < 20) {
        setState(() {
          _appBar = null;
          fab = null;
        });
      }
    }
  }

  Future<dynamic> buildNewsList() async {
    Network network = Network();
    var data = await network.getAllNews();
//print(data);
    for (int i = 0; i < data.length; i++) {
      setState(() {
        list.add(NewsList(
          imageUrl: data[i]['image'],
          title: data[i]['post_title'],
          idValue: data[i]['ID'],
          date: data[i]['post_date'],
        ));
      });
    }
//    return list;
  }

  Future<dynamic> updateNewsList() async {
    Network network = Network();
    var data = await network.getAllNewsByLimit(limit);
//print(data);
    for (int i = 0; i < data.length; i++) {
      setState(() {
        list.add(NewsList(
          imageUrl: data[i]['image'],
          title: data[i]['post_title'],
          date: data[i]['post_date'],
          idValue: data[i]['ID'],
        ));
      });
      setState(() {
        limit = limit + 10;
      });
    }
//    return list;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEEF0F9),
        appBar: _appBar,
        floatingActionButton: fab,
        body: ListView(
          controller: _scrollController,
          children: <Widget>[
            Opacity(opacity: _opacity, child: ChoseTopic()),
            FeaturedArticles(trigger: () {
              setState(() {
                _opacity = 1.0;
              });
            }),
            Opacity(opacity: _opacity, child: ForYou(list: list)),
          ],
        ));

  }
}
