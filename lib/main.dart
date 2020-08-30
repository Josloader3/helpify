import 'package:flutter/material.dart';
import 'package:helpify/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helpify',
      theme: ThemeData(
        primaryColor: Color(0xFFFFDB15),
      ),
      initialRoute: "/",
      routes: getRoutesMaterial(),
    );
  }
}