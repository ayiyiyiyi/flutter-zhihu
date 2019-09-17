import 'package:flutter/material.dart';
class AnswerDetailPage extends StatefulWidget {
  final Map arguments;

  const AnswerDetailPage({Key key, this.arguments}) : super(key: key);
  @override
  _AnswerDetailPageState createState() => _AnswerDetailPageState();
}

class _AnswerDetailPageState extends State<AnswerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Text(widget.arguments['title'])
    );
  }
}