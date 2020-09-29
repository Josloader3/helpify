import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helpify/src/bloc/provider.dart';
import 'package:helpify/src/bloc/register_ong_bloc.dart';
import 'package:helpify/src/models/ong_model.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegistrationONG extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  final fDB = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();

    final bloc = Provider.of(context).registerOngBloc;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.greenAccent,
                child: SingleChildScrollView(
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
                            Text("Registro", style: TextStyle(fontSize: 30)),
                            SizedBox(height: 30.0),
                            _emailTextField(bloc),
                            SizedBox(height: 30.0),
                            _passwordTextField(bloc),
                            SizedBox(height: 30.0),
                            _repeatPasswordTextField(bloc),
                            SizedBox(height: 30.0),
                            _nameTextField(bloc),
                            SizedBox(height: 30.0),
                            _descripctionTextField(bloc),
                            SizedBox(height: 30.0),
                            _hacerBoton(bloc),
                          ],
                        ),
                      ),
                      Text("¿Olvido la contraseña?"),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _emailTextField(RegisterOngBloc bloc) {
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

  Widget _passwordTextField(RegisterOngBloc bloc) {
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

  Widget _repeatPasswordTextField(RegisterOngBloc bloc) {
    return StreamBuilder(
      stream: bloc.repeatPasswordStream,
      builder: (context, snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "Repetir Contraseña",
            ),
            onChanged: bloc.changeRepeatPassword,
          ),
        );
      },
    );
  }

  Widget _nameTextField(RegisterOngBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (context, snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.account_box),
              labelText: "Nombre",
            ),
            onChanged: bloc.changeName,
          ),
        );
      },
    );
  }

  Widget _descripctionTextField(RegisterOngBloc bloc) {
    return StreamBuilder(
      stream: bloc.descriptionStream,
      builder: (context, snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.account_box),
              labelText: "Nombre",
            ),
            onChanged: bloc.changeDescription,
          ),
        );
      },
    );
  }

  Widget _hacerBoton(RegisterOngBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (context, snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text("Registrar"),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //cambiar el color del botón :está feo
          color: Color(0xFFFFDB15),
          textColor: Colors.black,
          onPressed: () => _registrarUsuario(bloc, context),
        );
      },
    );
  }

  _registrarUsuario(RegisterOngBloc bloc, BuildContext context) async {
    try {
      User user =
          (await _auth.createUserWithEmailAndPassword(
            email: bloc.email,
            password: bloc.password,
          )).user;
      if (user != null) {
        String uID = user.uid;

        Ong ong = new Ong();
        ong.id = uID;
        ong.nombre = bloc.name;
        ong.descripcion = bloc.description;

        fDB.reference().child("ongs").child(uID).set(ong.toJson()).then((onValue) {
          prefs.idLogin = uID;
          prefs.rol = 2;
          Navigator.pushReplacementNamed(context, "menu");
          return true;
        }).catchError((onError) {
          // TODO: AlertDialog with error
          print(onError);
          return false;
        });
      } else {
        // TODO: AlertDialog with error
      }
    } catch (e) {
      print(e);
      //bloc.email = "";
      //bloc.password = "";
      // TODO: AlertDialog with error
    }
  }
}
