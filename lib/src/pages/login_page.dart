import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helpify/src/bloc/login_bloc.dart';
import 'package:helpify/src/bloc/provider.dart';
import 'package:helpify/src/models/ong_model.dart';
import 'package:helpify/src/models/usuario_model.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  final fDB = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();

    final bloc = Provider.of(context).loginBloc;
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
                            _emailTextField(bloc),
                            SizedBox(height: 30.0),
                            _passwordTextField(bloc),
                            SizedBox(height: 30.0),
                            _HacerBoton(bloc),
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

  Widget _emailTextField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.mail),
              labelText: "E-mail",
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _passwordTextField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "Contraseña",
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _HacerBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (context, snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text("Iniciar sesión"),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //cambiar el color del botón :está feo
          color: Colors.greenAccent,
          textColor: Colors.black,
          onPressed: () => _loginUsuario(bloc, context),
        );
      },
    );
  }

  _loginUsuario(LoginBloc bloc, BuildContext context) async {
    try {
      User user =
      (await _auth.signInWithEmailAndPassword(
          email: bloc.email,
          password: bloc.password,
      )).user;
      if (user != null) {
        String uID = user.uid;
        prefs.idLogin = uID;

        DatabaseReference _publicacionesReference;
        _publicacionesReference = fDB.reference().child("usuarios").child(uID);
        _publicacionesReference.onValue.listen((event) {
          if(event.snapshot.value != null){
            prefs.rol = 1;

            Usuario usuario = Usuario.fromJson(HashMap.from(event.snapshot.value));
            prefs.usuario = usuario;
          }
        });

        _publicacionesReference = fDB.reference().child("ongs").child(uID);
        _publicacionesReference.onValue.listen((event) {
          if(event.snapshot.value != null){
            prefs.rol = 2;

            Ong ong = Ong.fromJson(HashMap.from(event.snapshot.value));
            prefs.ong = ong;
          }
        });
        Navigator.pushReplacementNamed(context, "menu");
      } else {

      }
    } catch (e) {
      print(e);
      //bloc.email = "";
      //bloc.password = "";
      // TODO: AlertDialog with error
    }
  }

}
