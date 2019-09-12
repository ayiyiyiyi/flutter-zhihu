import 'package:flutter/material.dart';
import 'package:my_zhihu_flutter/components/questionCard.dart';
import 'package:my_zhihu_flutter/mockData.dart';

class Hot extends StatefulWidget {
  @override
  _HotState createState() => _HotState();
  
}
class _HotState extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    List questions = questionList.map((e) => questionCard(e, context)).toList();
    // TODO: implement build
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        children: questions,
      )
    );
  }

}