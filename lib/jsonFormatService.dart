import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import './mockData.dart';

Future<String> _loadQuestionDetailJson() async {
  return await rootBundle.loadString('assets/question.json');
}
Future<QuestionDetail> decodeJson() async {
  String questionDetail = await _loadQuestionDetailJson();
  final jsonMap = json.decode(questionDetail);
  QuestionDetail question = new QuestionDetail.formatJson(jsonMap);
  return  question;
}