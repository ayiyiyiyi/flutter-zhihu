import 'package:flutter/material.dart';
import 'mockData.dart';
import 'cmpt/contetCard.dart';
class Follow extends StatefulWidget {
  @override
  _FollowState createState() => _FollowState();
  
}
class _FollowState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    List contentList = articleList.map((e) => contentCard(e, context,showOrigin: true)).toList();
    // TODO: implement build
    return new SingleChildScrollView(
      child: new Container(
        child: new Column(
          children: contentList,
        )
      ),
    );
  }

}