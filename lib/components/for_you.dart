import 'package:flutter/material.dart';
import 'package:flutter_app/components/news_list.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/helper/http.dart';
import 'package:flutter_app/screens/news_detail_screen.dart';

class ForYou extends StatefulWidget {
  ForYou({this.list});

    final List<NewsList> list;
  @override
  _ForYouState createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {


  initState() {
    super.initState();
//    buildNewsList();
  }

//  Future<dynamic> buildNewsList() async {
//    Network network = Network();
//    var data = await network.getAllNews();
////print(data);
//    for (int i = 0; i < data.length; i++) {
//      setState(() {
//        widget.list.add(NewsList(
//          imageUrl: data[i]['image'],
//          title: data[i]['post_title'],
//          idValue: data[i]['ID'],
//        ));
//      });
//    }
////    return list;
//  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'For you',
            style: kFontCustomStyle.copyWith(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.list,
          ),
        ],
      ),
    );
  }
}


