import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/helper/http.dart';
import 'package:flutter_app/screens/news_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class FeaturedArticles extends StatefulWidget {
  FeaturedArticles({this.trigger});
  final Function trigger;
  @override
  _FeaturedArticlesState createState() => _FeaturedArticlesState();
}

class _FeaturedArticlesState extends State<FeaturedArticles> {
  String url = '';
  String title = '';
  String idValue = '';
  bool _animation = true;
  double _radius = 20;
  double _opacity = 0.0;
  String date = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFeatureItem();
  }

  Future<dynamic> getFeatureItem() async {
    Network network = Network();
    var data = await network.getFeaturedNews();
    setState(() {
      url = data[0]['image'];
      title = data[0]['post_title'];
      idValue = data[0]['ID'];
      date = data[0]['post_date'];
      _animation = false;
      _radius = 1.0;
      widget.trigger();
      _opacity = 1.0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          CupertinoActivityIndicator(
            animating: _animation,
            radius: _radius,
          ),
          Opacity(
            opacity: _opacity,
            child: Text(
              'Featured Article',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF26325B),
                  fontFamily: 'sf',
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Opacity(
            opacity: _opacity,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsDetail(
                              id: idValue,
                            )));
              },
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: Text(
                        title,
                        style: kFontCustomStyle.copyWith(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 15.0),
                      child: Text(
                        date,
                        style: kFontCustomStyle.copyWith(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
