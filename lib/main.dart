import 'package:flutter/material.dart';
import 'package:helpify/src/bloc/provider.dart';
import 'package:helpify/src/routes/routes.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Helpify',
        theme: ThemeData(
          primaryColor: Color(0xFFFFDB15),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "splash",
        routes: getRoutesMaterial(),
      ),
    );
  }
}
