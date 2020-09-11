import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RegistrationONG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Registro"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            tooltip:"Volver",
            onPressed: (){
              Navigator.pop(context);
            },
          ),

        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.greenAccent,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
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
                          _emailTextField(context),
                          SizedBox(height: 30.0),
                          _passwordTextField(context),
                          SizedBox(height: 30.0),
                          _nameTextField(context),
                          SizedBox(height: 30.0),
                          _LastnameTextField(context),
                          SizedBox(height: 30.0),
                          _numberField(context),
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



  Widget _nameTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(Icons.account_box),
          labelText: "Nombre",
        ),
      ),
    );
  }



  Widget _LastnameTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(Icons.account_box,
              color: Colors.transparent
          ),
          labelText: "RUC",
        ),
      ),
    );
  }


  Widget _numberField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          icon: Icon(Icons.phone),
          labelText: "Teléfono",
        ),
      ),
    );
  }



  Widget _HacerBoton(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text("Registrar"),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      //cambiar el color del botón :está feo
      color: Color(0xFFFFDB15),
      textColor: Colors.black,
      onPressed: () {},
    );
  }
}
