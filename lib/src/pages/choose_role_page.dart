import 'package:flutter/material.dart';
import 'package:helpify/src/widgets/basic_button_widget.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';

class ChooseRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFDB15),
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
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
                      SizedBox(height: 300),
                      BasicButtonWidget("Soy Usuario", "primary", () => Navigator.pushNamed(context, "choose_optauth", arguments: "usuario")),
                      SizedBox(height: 20),
                      BasicButtonWidget("Soy Ong", "secondary", () => Navigator.pushNamed(context, "choose_optauth", arguments: "ong")),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
