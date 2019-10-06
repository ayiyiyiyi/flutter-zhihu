import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_zhihu_flutter/home/answerDetail.dart';
import 'package:my_zhihu_flutter/home/person.dart';
import 'package:my_zhihu_flutter/home/questionDetail.dart';
import 'package:my_zhihu_flutter/home/search.dart';
import 'state/index.dart';
import 'index.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  final Map<String, Function> _routes = {
    'answer_detail': (context, {arguments}) => AnswerDetailPage(arguments: arguments),
    'person_detail': (context, {arguments}) => PersonPage(arguments: arguments),
    'question_detail': (context, {arguments}) => QuestionDetailPage(arguments: arguments)
  };

  List<SingleChildCloneableWidget> _buildProviders(BuildContext context) {
    return [
      ChangeNotifierProvider(builder: (_) => ThemeProvider()),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _buildProviders(context),
      child: Consumer<ThemeProvider>(builder: (context, theme, _) {
        return MaterialApp(
          title: '逼乎',
          routes: {
            'search': (context) => SearchPage(),
          },
          onGenerateRoute: (RouteSettings settings) {
            final String name = settings.name;
            final Function pageContentBuilder = this._routes[name];

            if (pageContentBuilder != null) {
              return MaterialPageRoute(
                builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
              );
            }
          },
          home: Index(),
          theme: theme.currentTheme
        );
      })
    );
  }
}
