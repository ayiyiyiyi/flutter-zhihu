import 'package:flutter/material.dart';
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
              onPressed: () {
                Navigator.pushNamed(context, '/search',arguments: {'id': 1111});
              },
              icon: new Icon(
                Icons.search,
                size: 14.0
              ),
              label: new Text(
                "我是一个 · 搜索框",
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
              ),
              label: new Text(
                "提问",
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
            indicatorColor: Colors.blue,
            tabs: _tabs.map((e) => new Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            new Follow(),
            new Recommand(),
            new Hot()
          ],
        ),
      ),
    );
  }

}