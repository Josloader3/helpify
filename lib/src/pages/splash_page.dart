import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helpify/src/models/ong_model.dart';
import 'package:helpify/src/models/usuario_model.dart';
import 'package:helpify/src/pages/choose_role_page.dart';
import 'package:helpify/src/pages/menu_page.dart';
import 'dart:async';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final prefs = new PreferenciasUsuario();

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
            (status) {
              _navigateToHome();
            });
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  void _navigateToHome(){
    if(prefs.idLogin != ""){
      final _dbReference = FirebaseDatabase.instance.reference();
      //BUSCANDO EN USUARIOS
      _dbReference.child("usuarios").child(prefs.idLogin).onValue.listen((event) {
        if(event.snapshot.value != null) {
          Map<String, dynamic> decodedData = HashMap.from(event.snapshot.value);
          Usuario usuario = Usuario.fromJson(decodedData);
          print(usuario);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => MenuPage()
              )
          );
        }
      });

      //BUSCNADO EN ONG'S
      _dbReference.child("ongs").child(prefs.idLogin).onValue.listen((event) {
        if(event.snapshot.value != null){
          Map<String, dynamic> decodedData = HashMap.from(event.snapshot.value);
          Ong ong = Ong.fromJson(decodedData);
          print(ong);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => MenuPage()
              )
          );
        }
      });
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => ChooseRole()
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 219, 21, 7),
      body: Center(
        child: Image.asset("assets/images/helpify_logo_animat.gif"),
      ),
    );
  }


}