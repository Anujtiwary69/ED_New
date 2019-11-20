import 'package:flutter/material.dart';
import 'package:flutter_app/screens/news_detail_screen.dart';
import 'package:flutter_app/constant.dart';

class NewsList extends StatelessWidget {
  NewsList({this.imageUrl, this.title, this.idValue,this.date});
  final String imageUrl;
  final String title;
  final String idValue;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetail(
                    id: idValue,
                  )));
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(imageUrl),
                    )),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: kFontCustomStyle.copyWith(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    date,
                    style: kFontCustomStyle.copyWith(
                      fontSize: 16.0,
                      color: Color(0xFF858EAC),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}