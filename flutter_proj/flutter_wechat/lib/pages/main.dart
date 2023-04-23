import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
          splashColor: Color.fromRGBO(1, 0, 0, 0.0),
          cardColor: Color.fromRGBO(1, 1, 1, 0.65),),

      home: RootPage(),
    );
  }
}
