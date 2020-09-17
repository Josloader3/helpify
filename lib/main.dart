import 'package:flutter/material.dart';
import 'package:helpify/src/bloc/provider.dart';
import 'package:helpify/src/routes/routes.dart';
import 'package:helpify/src/providers/publicaciones_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*PublicacionesProvider provider = PublicacionesProvider();
    provider.getPublicaciones();*/
    return Provider(
      child: MaterialApp(
        title: 'Helpify',
        theme: ThemeData(
          primaryColor: Color(0xFFFFDB15),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: getRoutesMaterial(),
      ),
    );
  }
}