import 'package:flutter/material.dart';
import '../config.dart';
import 'hot.dart';
import 'follow.dart';
import 'recommand.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List _tabs = ['关注', '推荐', '热榜'];
  Widget searchBar() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton.icon(
              color: Colors.grey[800],
              onPressed: () {

              },
              icon: new Icon(
                Icons.search,
                color: GlobalConfig.fontColor,
                size: 14.0
              ),
              label: new Text(
                "我是一个 · 搜索框",
                style: new TextStyle(color: GlobalConfig.fontColor),
              ),
            ),
          ),
          new Container(
            child: new FlatButton.icon(
              onPressed: () {

              },
              icon: Icon(
                Icons.border_color,
                size: 14,
                color: GlobalConfig.globalColor,
              ),
              label: new Text(
                "提问",
                style: new TextStyle(color: GlobalConfig.globalColor),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: searchBar(),
          bottom: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: GlobalConfig.dark == true ? Colors.white : Colors.black26,
            indicatorColor: Colors.blue,
            tabs: _tabs.map((e) => new Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            new Follow(),
            new Hot(),
            new Recommand()
          ],
        ),
      ),
    );
  }

}