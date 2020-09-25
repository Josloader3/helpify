import 'package:flutter/material.dart';
import 'package:helpify/src/widgets/basic_button_widget.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';

class ChooseOptAuthRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String role = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFFFDB15),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CabeceraWidget(titulo: (role=="usuario")?"Usuario":"ONG",),
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
              SizedBox(height: 300),
              BasicButtonWidget("Ya tengo cuenta", "primary", () => Navigator.pushNamed(context, "login", arguments: role)),
              SizedBox(height: 20),
              BasicButtonWidget("Deseo registarme", "secondary", () => Navigator.pushNamed(context, (role=="usuario")?"registration":"registration_ong", arguments: "")),
            ],
          ),
        )
      ),
    );
  }
}
