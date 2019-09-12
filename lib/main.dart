import 'package:flutter/material.dart';
import 'package:my_zhihu_flutter/home/answerDetail.dart';
import 'package:my_zhihu_flutter/home/person.dart';
import 'package:my_zhihu_flutter/home/questionDetail.dart';
import 'index.dart';
import 'config.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '逼乎',
      initialRoute:"/",
      routes: {
        '/': (context) => Index(),
        'answer_detail': (context) => AnswerDetailPage(),
        'person_detail': (context) => PersonPage(),
        'question_detail': (context) => QuestionDetailPage()
      },
      theme: new ThemeData.dark(),
    );
  }
}
