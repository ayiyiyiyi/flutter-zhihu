import 'package:flutter/material.dart';
class QuestionDetailPage extends StatefulWidget {
  final Map arguments;

  const QuestionDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  _QuestionDetailPageState createState() => _QuestionDetailPageState();
  
}
class _QuestionDetailPageState extends State<QuestionDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: new Text(widget.arguments['title']),
    );
  }
  
}