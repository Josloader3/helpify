import 'package:flutter/material.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            CabeceraWidget(titulo: "Método\nde pago",),
            _crearListaTipoPago(),
            _crearFormMonto(),
            _crearBoton(),
          ],
        ),
      ),
      backgroundColor: Color(0xFFD4A3FF),
    );
  }

  Widget _crearCabecera(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            LineAwesomeIcons.arrow_circle_left,
            size: 70.0,
          ),
        ),
        Text(
            "Método\nde Pago",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40
            ),
        ),
      ],
    );
  }

  Widget _crearListaTipoPago() {
    return Container();
  }

  Widget _crearFormMonto() {
    return Container();
  }

  Widget _crearBoton() {
    return Container();
  }
}
