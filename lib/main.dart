import 'package:flutter/material.dart';
import 'package:monday/pages/home_page.dart';
import 'package:monday/widgets/client-provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: 'https://api.monday.com/v2',
      child: MaterialApp(
        title: 'Monday',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color(0xff07a3b2),
            accentColor: Color(0xffd9ecc7),
            textTheme: TextTheme(
                title: TextStyle(color: Colors.white, fontSize: 24.0))),
        home: HomePage(),
      ),
    );
  }
}
