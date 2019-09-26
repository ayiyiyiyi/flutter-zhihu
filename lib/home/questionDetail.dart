import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_zhihu_flutter/config.dart';
import 'package:my_zhihu_flutter/mockData.dart';
import './../jsonFormatService.dart';

class QuestionDetailPage extends StatefulWidget {
  final Map arguments;

  const QuestionDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  _QuestionDetailPageState createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  QuestionDetail detail;
  bool desClip;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    decodeJson().then((value) => {
          setState(() {
            detail = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget loading() {
      return new Center(child: new CircularProgressIndicator());
    }
    Widget singleTag(tag) {
      return Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.only(bottom: 4, left: 10, right: 10, top: 4),
        child: Text(
          tag.name,
          style: TextStyle(fontSize: 12, color: GlobalConfig.fontColor),
        ),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(
            Radius.circular(3.0),
          ),
        ),
      );
    }
    Widget tagsWidget = new Container(
      child: new SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: new Row(
            children: detail != null ? detail.tagList.map((tag) => singleTag(tag)).toList() : []
        )
        ),
      ),
    );
    Widget description() {

    }
    bool isClip(String text) {
      TextPainter _textpainer = TextPainter(
        maxLines: 4,
        text: TextSpan(text:text),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: MediaQuery.of(context).size.width, minWidth: MediaQuery.of(context).size.width);
      
      print(_textpainer.didExceedMaxLines);
      if (_textpainer.didExceedMaxLines) {
        setState(() {
          desClip = true;
        });
      } else {
        setState(() {
          desClip = false;
        });
      }
    }
    if (detail.description != null) {
      isClip(detail.description);
    }
    Widget questionDetailBody() {
      return new SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 6, left: 10, right: 10, top: 4),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              tagsWidget,
              Container(
                child: Text(
                  detail.title,
                  style: TextStyle(color: GlobalConfig.fontColor, fontSize: 18,fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(right: 4, left: 4),
                padding: EdgeInsets.only(bottom: 6),
              ),
              Container(
                margin: EdgeInsets.only(right: 4, left: 4),
                child: Text(detail.description,
                  style: TextStyle(color: GlobalConfig.fontColor,fontSize: 14),
                  maxLines: 4,
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
        )
      );
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          detail != null && detail.title != null ? detail.title : '问题',
          style: TextStyle(color: GlobalConfig.fontColor, fontSize: 14),
        ),
      ),
      body: detail != null && detail.title != null
          ? questionDetailBody()
          : loading(),
    );
  
  }
  
}
