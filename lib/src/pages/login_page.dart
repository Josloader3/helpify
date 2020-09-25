import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Color(0xFFFFDB15),
              height: size.height,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      CabeceraWidget(titulo: "",),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 30.0, width: double.infinity),
                          Text("Helpify",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 90.0,
                                fontFamily: "Bukhari",
                              )
                          ),
                          SizedBox(height: 1.0, width: double.infinity),
                        ],
                      ),
                      // Container(height: 5.0),
                      Container(
                        width: size.width * 0.85,
                        margin: EdgeInsets.symmetric(vertical: 30.0),
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3.0,
                                  offset: Offset(0.0, 5.0),
                                  spreadRadius: 3.0)
                            ]),
                        child: Column(
                          children: <Widget>[
                            Text("Login", style: TextStyle(fontSize: 30)),
                            SizedBox(height: 30.0),
                            _emailTextField(context),
                            SizedBox(height: 30.0),
                            _passwordTextField(context),
                            SizedBox(height: 30.0),
                            _HacerBoton(context),
                          ],
                        ),
                      ),
                      Text("¿Olvido la contraseña?"),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget _emailTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.mail),
          labelText: "E-mail",
        ),
      ),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: "Contraseña",
        ),
      ),
    );
  }

  Widget _HacerBoton(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text("Iniciar sesión"),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      //cambiar el color del botón :está feo
      color: Colors.greenAccent,
      textColor: Colors.black,
      onPressed: () => {
        Navigator.of(context).pushNamedAndRemoveUntil('menu', (Route<dynamic> route) => false)
      },
    );
  }
}
