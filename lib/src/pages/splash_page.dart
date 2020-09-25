import 'package:flutter/material.dart';
import 'package:helpify/src/pages/choose_role_page.dart';
import 'dart:async';
import 'package:helpify/src/routes/routes.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => ChooseRole()
        )
    );
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