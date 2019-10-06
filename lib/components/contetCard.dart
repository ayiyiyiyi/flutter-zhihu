import 'package:flutter/material.dart';
import '../mockData.dart';
import '../config.dart';
Widget synopsisCard(Article article, context) {
  Widget synopsis;
  if (article.imgUrl == null) {
    synopsis = new Text(
      article.synopsis,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: new TextStyle(height: 1.4,),
    );
  } else {
    synopsis = new Row(
      children: <Widget>[
        new Expanded(
          flex: 2,
          child: new Container(
            padding: EdgeInsets.only(right: 5.0),
            child: new Text(
              article.synopsis,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: new TextStyle(height: 1.4),
            ),
          ),
        ),
        new Expanded(
          flex: 1,
          child: new AspectRatio(
            aspectRatio: 3.0 / 2.0,
            child: new Container(
              foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(article.imgUrl),
                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                ),
                borderRadius: const BorderRadius.all(const Radius.circular(6.0))
              )
            ),
          ),
        )
      ],
    );
  }
  return new GestureDetector(
    onTap: () {
     Navigator.pushNamed(context, 'answer_detail',arguments: {'title':article.title});
    },
    child:new Container(
      padding: EdgeInsets.only(top:2.0, left: 12.0, right: 12.0,bottom: 0),
      child: new Column(
        children: <Widget>[
          synopsis,
          new Container(
            padding: const EdgeInsets.only(),
            margin: EdgeInsets.all(0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text(
                    article.agreeNum.toString() + ' 赞同 · ' + article.commentNum.toString() + ' 评论',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                    )
                ),
                new PopupMenuButton(
                  padding: const EdgeInsets.all(0),
                  icon: new Icon(Icons.more_horiz),
                  itemBuilder:(BuildContext context) => <PopupMenuItem<String>>[
                    new PopupMenuItem(
                      value: '0',
                      child: new Text('屏蔽这个问题'),
                    ),
                    new PopupMenuItem(
                      value: '1',
                      child: new Text('举报'),
                    )
                  ],
                )
              ],
            ),
          )
        
        ],
      ),
    )
  );
}
Widget contentCard(Article article, context, {showOrigin}) {
  Widget titleWidget(Article article, context) {
    return new GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'question_detail', arguments: {'title': article.title});
      },
      child: new Container(
        padding: EdgeInsets.only(top: 4.0, left: 12.0, right: 12.0,bottom: 0),
        child: new Text(
          article.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
        ),
        alignment: Alignment.centerLeft
      ),
    );
  }
  Widget personWidget(Article article, context) {
    return new GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'person_detail',arguments: {'name':article.user});
      },
      child: new Container(
        margin:  EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0,bottom: 0),
        child: new Row(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(right: 8.0),
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(article.headUrl),
                radius: 10.0,
              ),
            ),
            new Text(
              article.user + article.action + ' · ' + article.time,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      )
    );
  }
  List<Widget> contentCardCmpList;
  if (showOrigin == true) {
    contentCardCmpList = [
      personWidget(article, context),
      titleWidget(article, context),
      synopsisCard(article, context)
    ];
  } else {
    contentCardCmpList = [
      titleWidget(article, context),
      synopsisCard(article, context)
    ];
  }
  return new Container(
    margin: EdgeInsets.only(bottom: 5.0),
    child: new Column(
      children: contentCardCmpList
    ),
  );
}
  