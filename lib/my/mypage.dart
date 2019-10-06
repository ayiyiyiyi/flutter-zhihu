import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_zhihu_flutter/config.dart';
import 'package:my_zhihu_flutter/state/index.dart';
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Widget searchBar() {
    return new Row(
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
        new Icon(Icons.crop_free,size: 20)
      ],
    );
  }    
  Widget myProfileWidget() {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(6.0))
            ),
            child: GestureDetector(
              onTap: () {},
              child: new ListTile(
                  leading: new Container(
                    child: new CircleAvatar(
                        backgroundImage: new NetworkImage("https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                        radius: 20.0
                    ),
                  ),
                  title: new Container(
                    margin: const EdgeInsets.only(bottom: 2.0),
                    child: new Text("learner"),
                  ),
                  subtitle: new Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    child: new Text("查看或编辑个人主页"),
                  ),
                 ),
            ),
          ),
          Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton (
                      onPressed: (){},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text("57", style: new TextStyle(fontSize: 16.0, color: GlobalConfig.fontColor),),
                            ),
                            new Container(
                              child: new Text("我的创作", style: new TextStyle(fontSize: 12.0, color: GlobalConfig.fontColor),),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(color: GlobalConfig.dark == true ?  Colors.white12 : Colors.black12, width: 1.0)
                      )
                  ),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: (){},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text("210", style: new TextStyle(fontSize: 16.0, color: GlobalConfig.fontColor),),
                            ),
                            new Container(
                              child: new Text("关注", style: new TextStyle(fontSize: 12.0, color: GlobalConfig.fontColor),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(color: GlobalConfig.dark == true ?  Colors.white12 : Colors.black12, width: 1.0)
                      )
                  ),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: (){},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text("18", style: new TextStyle(fontSize: 16.0, color: GlobalConfig.fontColor),),
                            ),
                            new Container(
                              child: new Text("我的收藏", style: new TextStyle(fontSize: 12.0, color: GlobalConfig.fontColor),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(color: GlobalConfig.dark == true ?  Colors.white12 : Colors.black12, width: 1.0)
                      )
                  ),
                ),
                new Container(
                    width: (MediaQuery.of(context).size.width - 6.0) / 4,
                    child: new FlatButton(
                        onPressed: (){},
                        child: new Container(
                          height: 50.0,
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                child: new Text("33", style: new TextStyle(fontSize: 16.0, color: GlobalConfig.fontColor),),
                              ),
                              new Container(
                                child: new Text("最近浏览", style: new TextStyle(fontSize: 12.0, color: GlobalConfig.fontColor),),
                              )
                            ],
                          ),
                        )
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  List serviceList = ['大学', '已购', 'live', '余额','书架','私家课','咨询','广场'];
  Widget singleCardWidget(String text,) {
    return Container(
      margin: const EdgeInsets.only(top: 4,bottom: 4.0),
      width: MediaQuery.of(context).size.width / 4,
      child:  GestureDetector(
        onTap: () {},
        child: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(bottom: 6.0),
              child: new CircleAvatar(
                radius: 14.0,
                child: new Icon(Icons.live_help, color: Colors.white,size: 16),
                backgroundColor: Colors.grey[600],
              ),
            ),
            new Container(
              child: new Text(text, style: new TextStyle(fontSize: 12.0)),
            )
          ],
        ),
      )
    );
  }
  Widget serviceWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10.0),
      child: Wrap(
        runAlignment: WrapAlignment.start,
        children: serviceList.map((e) => singleCardWidget(e)).toList()
      )
    );
  } 
  Widget settingWidget(ThemeProvider themedata) {
    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10.0),
      child: new Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {},
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  child: new CircleAvatar(
                    radius: 14.0,
                    child: new Icon(Icons.local_florist, color: Colors.white,size: 16),
                    backgroundColor: Colors.yellow[800],
                  ),
                ),
                new Container(
                  child: new Text('社区建设', style: new TextStyle(fontSize: 12.0)),
                )
              ],
            ),
          ),
        ),
         Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {},
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  child: new CircleAvatar(
                    radius: 14.0,
                    child: new Icon(Icons.live_help, color: Colors.white,size: 16),
                    backgroundColor: Colors.grey[600],
                  ),
                ),
                new Container(
                  child: new Text("反馈与帮助", style: new TextStyle(fontSize: 12.0)),
                )
              ],
            ),
          ),
        ),
         Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                GlobalConfig.dark = false;
                if (themedata.isDark) {
                  themedata.switchToLight();
                } else {
                  themedata.switchToDark();
                }
              });
              
            },
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  child: new CircleAvatar(
                    radius: 14.0,
                    child: new Icon(themedata.isDark == true ? Icons.brightness_5 : Icons.brightness_2, color: Colors.white,size: 16),
                    backgroundColor: themedata.isDark == true ? Colors.yellow[700] : Colors.purple[800],
                  ),
                ),
                new Container(
                  child: new Text(themedata.isDark == true ? "日间模式" : "夜间模式", style: new TextStyle(fontSize: 12.0)),
                )
              ],
            ),
          ),
        ),
         Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {},
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  child: new CircleAvatar(
                    radius: 14.0,
                    child: new Icon(Icons.menu, color: Colors.white,size: 16),
                    backgroundColor: Colors.grey[600],
                  ),
                ),
                new Container(
                  child: new Text("设置", style: new TextStyle(fontSize: 12.0)),
                )
              ],
            ),
          ),
        ),
      
      
      
      ],
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final themedata = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: searchBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            myProfileWidget(),
            serviceWidget(),
            settingWidget(themedata)
          ],
        ),
      ),
    );
  }
}