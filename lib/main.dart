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
            primarySwatch: Colors.pink,
            textTheme: TextTheme(
                title: TextStyle(color: Colors.white, fontSize: 24.0))),
        home: HomePage(),
      ),
    );
  }
}
