import 'package:flutter/material.dart';
import 'package:my_zhihu_flutter/config.dart';
import 'package:my_zhihu_flutter/mockData.dart';

Widget questionCard(Question question, context) {
  Widget sortCmpt;
  Widget titleCmpt;
  Widget imgCmpt;
  Widget cardWidget;

  sortCmpt = new Container(
    width: 30,
    child: Text(
      question.sort,
      style: TextStyle(
          fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
  titleCmpt = Expanded(
    flex: 2,
    child: new Column(
      children: [
        Container(
          child: Text(
            question.title,
            textAlign: TextAlign.left,
            style: TextStyle(color: GlobalConfig.fontColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.centerLeft),
        Container(
          child: Text(
            question.hotNum.toString() + '热度',
            textAlign: TextAlign.left,
            style: TextStyle(color: GlobalConfig.fontColor),
          ),
          alignment: Alignment.centerLeft
        ),
      ]
    )
  );
  List<Widget> cardChildren;
  if (question.imgUrl == null) {
   cardChildren = [sortCmpt, titleCmpt];
  } else {
    imgCmpt = Expanded(
      flex: 1,
      child: new AspectRatio(
        aspectRatio: 3.0 / 2.0,
        child: new Container(
          foregroundDecoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(question.imgUrl),
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
              borderRadius: const BorderRadius.all(const Radius.circular(6.0))),
        ),
      ),
    );
    cardChildren = [sortCmpt, titleCmpt, imgCmpt];
  }
  cardWidget = new GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'question_detail');
    },
    child: new Container(
      padding: EdgeInsets.only(top: 8.0, left: 0, right: 10.0,bottom: 8),
      margin: EdgeInsets.only(bottom: 1),
      color: GlobalConfig.cardBackgroundColor,
      child: new Row(
        children: cardChildren,
      ),
    ),
  );
  return cardWidget;
}
