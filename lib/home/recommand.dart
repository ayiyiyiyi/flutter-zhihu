import 'package:flutter/material.dart';
import 'package:my_zhihu_flutter/mockData.dart';
import 'package:my_zhihu_flutter/components/contetCard.dart';

class Recommand extends StatefulWidget {
  @override
  _RecommandState createState() => _RecommandState();
  
}
class _RecommandState extends State<Recommand> {
  @override
  Widget build(BuildContext context) {
    List contentList = articleList.map((e) => contentCard(e, context, showOrigin: false)).toList();

    // TODO: implement build
    return new SingleChildScrollView(
      child: new Container(
        child: new Column(
          children: contentList,
        ),
      ),
    );
  }

}