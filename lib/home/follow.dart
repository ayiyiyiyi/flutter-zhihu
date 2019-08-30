import 'package:flutter/material.dart';
import 'article.dart';
import '../config.dart';
class Follow extends StatefulWidget {
  @override
  _FollowState createState() => _FollowState();
  
}
class _FollowState extends State<Follow> {
  Widget contentCard(Article article) {
    Widget synopsisWidget;
    if (article.imgUrl == null) {
      synopsisWidget = new Text(
        article.synopsis,
        style: new TextStyle(height: 1.4, color: GlobalConfig.fontColor),
      );
    } else {
      synopsisWidget = new Row(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Container(
              padding: EdgeInsets.only(right: 5.0),
              child: new Text(
                article.synopsis,
                style: new TextStyle(height: 1.4,color: GlobalConfig.fontColor),
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
    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: EdgeInsets.only(bottom: 5.0),
      child: new FlatButton(
        padding: EdgeInsets.all(12.0),
        onPressed: () { },
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[

                ],
              ),
            ),
            new Container(
              child: new Text(
                article.title,
                style: TextStyle(color: GlobalConfig.fontColor,fontSize: 16.0),
                )
            ),
            synopsisWidget,
            new Container()
          ],
        ),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    List contentList = articleList.map((e) => contentCard(e)).toList();
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