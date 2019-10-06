import 'package:flutter/material.dart';
import 'config.dart';
import 'home/home.dart';
import 'think/think.dart';
import 'market/market.dart';
import 'notification/notification.dart';
import 'my/mypage.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IndexState();
}
class _IndexState extends State<Index>{
  int _currentIndex = 0;
  StatefulWidget _currentPage;
  List<StatefulWidget> _pages;
  void initState() {
    super.initState();
    _pages = <StatefulWidget> [
        new HomePage(),
        new ThinkPage(),
        new MarketPage(),
        new NotificationPage(),
        new MyPage()
      ];
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new  Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor:GlobalConfig.globalColor,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.assignment,
              ),
              title: new Text('首页')
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.all_inclusive,
              ),
              title: new Text('想法')
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.add_shopping_cart,
              ),
              title: new Text('市场'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.add_alert,
              ),
              title: new Text('消息')
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.perm_identity,
              ),
              title: new Text('我的')
            )
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
    );
  }

}