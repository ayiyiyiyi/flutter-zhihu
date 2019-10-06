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
  bool desExpand = false;
  double spacing = 10;
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
    
    void showAlldescription() {
      setState(() {
        desExpand = true;
      });
    }
    //判断问题描述是否需要折叠
    bool isClip(String text) {
      double desWidth = MediaQuery.of(context).size.width - (spacing + 4) * 2;
      bool desNeedClip;
      TextPainter _textpainer = TextPainter(
        maxLines: 4,
        text: TextSpan(text:text),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: desWidth, minWidth: desWidth);
      if (_textpainer.didExceedMaxLines) {
        desNeedClip = true;
      } else {
        desNeedClip = false;
      }
      return desNeedClip;
    }
    Widget loading() {
      return new Center(child: new CircularProgressIndicator());
    }
    Widget singleTag(tag) {
      return Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.only(bottom: 4, left: spacing, right: spacing, top: 4),
        child: Text(
          tag.name,
          style: TextStyle(fontSize: 12),
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
      if (detail != null && detail.description != null) {
        TextStyle desStyle = TextStyle(fontSize: 14);
        if (isClip(detail.description)) {
          if (desExpand) {
             return Container(
              child:  Text(
                detail.description,
                style: desStyle
              ),
            );
          } else{
            return Container(
              child:  Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      detail.description,
                      maxLines: 4,
                      style: desStyle,
                      overflow: TextOverflow.ellipsis,
                    )
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: (){ 
                        showAlldescription();
                      },
                      child: Text(
                        '查看全部',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    right: 4,
                    bottom: 0,
                  )
                ],
              ),
            );
          }
        } else {
          return Container(
            child: Text(
              detail.description,
              maxLines: 4,
              overflow: TextOverflow.clip,
              style: desStyle
            ),
          );
        }
      } else {
        return null;
      }
    }
    Widget buttonWidget() {
      TextStyle buttonStyle = TextStyle(fontSize: 14);
      return Container(
        padding: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1.0, color: Colors.grey[800]),)
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(width: 1.0, color: Colors.grey[800]),)
                ),
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.person_add,size: 16),
                  label: Text('邀请回答', style: buttonStyle,),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add,size: 16),
                  label: Text('写答案', style: buttonStyle,),
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget questionDetailBody() {
      int followNumber = detail != null && detail.followNumber != null ? detail.followNumber : 0;
      int commentNumber = detail != null && detail.commentNumber != null ? detail.commentNumber : 0;

      return new SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 0, left: spacing, right: spacing, top: 4),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              tagsWidget,
              Container(
                child: Text(
                  detail.title,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(right: 4, left: 4),
                padding: EdgeInsets.only(bottom: 6),
              ),
              description(),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          followNumber.toString() + '个关注   ' + commentNumber.toString() + '个回答',
                          style: TextStyle(fontSize: 12),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:9, bottom: 9),
                      width: 76,
                      height: 30,
                      color: Colors.blueGrey[600],
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add,size: 12,),
                        label: Text('关注'),
                      ),
                    )
                  ],
                ),
              ),
              buttonWidget(),
              
            ],
          ),
        )
      );
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          detail != null && detail.title != null ? detail.title : '问题',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: detail != null && detail.title != null
          ? questionDetailBody()
          : loading(),
    );
  
  }
  
}
