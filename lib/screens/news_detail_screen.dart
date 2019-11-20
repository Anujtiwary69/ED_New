import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/helper/http.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetail extends StatefulWidget {
  NewsDetail({this.id});
  String id;
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  String url = '';
  String title = '';
  String des = '';
  bool _fetchData = true;
  bool _animation = true;
  double _radius = 20.0;
  ScrollController _controller;
  AppBar _appBar;

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    _appBar = AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: Color(0xFFEEF0F9),
      elevation: 0.0,
//      title: Text(title,style: kTitle.copyWith(fontSize: 18.0),),
    );
    print(widget.id);
    getFeatureItem();
  }

  _scrollListener() {
    if (_controller.offset > 73) {
      setState(() {
        _appBar = AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Color(0xFFEEF0F9),
          elevation: 0.0,
          title: Text(
            title,
            style: kTitle.copyWith(fontSize: 18.0),
          ),
        );
      });
    } else {
      setState(() {
        _appBar = AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Color(0xFFEEF0F9),
          elevation: 0.0,
//      title: Text(title,style: kTitle.copyWith(fontSize: 18.0),),
        );
      });
    }
  }

  Future<dynamic> getFeatureItem() async {
    Network network = Network();
    var data = await network.getNewDetail(widget.id);
    setState(() {
      url = data[0]['image'];
      title = data[0]['post_title'];
      des = data[0]['post_content'];
      _fetchData = false;
      _animation = false;
      _radius = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_fetchData) {
      return Scaffold(
        backgroundColor: Color(0xFFEEF0F9),
        appBar: null,
        body: Center(
          child: CupertinoActivityIndicator(
            animating: true,
            radius: 20.0,
          ),
        ),
      );
    } else {}
    return Scaffold(
      backgroundColor: Color(0xFFEEF0F9),
      appBar: _appBar,
      body: ListView(
        controller: _controller,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
            child: Text(
              title,
              style: kTitle.copyWith(fontSize: 25.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.fitHeight),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
            ),
          ),
          Html(
            data: des,
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
          ),
        ],
      ),
    );
  }
}
