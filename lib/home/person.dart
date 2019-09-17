import 'package:flutter/material.dart';
class PersonPage extends StatefulWidget {
  final Map arguments;
  const PersonPage({Key key, this.arguments}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text(widget.arguments['name']),
    );
  }
}