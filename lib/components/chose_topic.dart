import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ChoseTopic extends StatelessWidget {
  List<String> chooseLabel = [
    'Travel',
    'Technology',
    'Lifestyle',
    'Fashion',
    'Technology',
    'Videos',
  ];
  List<Color> labelColor = [
    Color(0xFFFFA200),
    Color(0xFFFF5500),
    Color(0xFF2D5FFF),
    Color(0xFFFFA200),
    Color(0xFFFF5500),
    Color(0xFF2D5FFF),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, right: 25, left: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Text(
                    'Choose your topics',
                    style: kTitle,
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: 'icon',
                    child: CircleAvatar(
                      child: Icon(
                        Icons.account_circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return Container(
                height: 0,
                width: 141,
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20.0),
                decoration: BoxDecoration(
                  color: labelColor[index],
                  borderRadius: BorderRadius.all(Radius.circular(100),),
                  boxShadow: [
                     BoxShadow(
                      color: Color(0xFFCBCEDF),
                      offset: new Offset(2.0, 2.0),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    chooseLabel[index].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'sf',
                      fontSize: 17.0,
                      color: Colors.white

                    ),
                  ),
                ),
              );
            },
              itemCount: chooseLabel.length,
              scrollDirection: Axis.horizontal,
            ),
          )

        ],
      ),
    );
  }
}
