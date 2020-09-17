import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class CabeceraWidget extends StatelessWidget {

  final String titulo;

  const CabeceraWidget({Key key, this.titulo}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: Text(
            titulo,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40
            ),
          ),
        ),
      ],
    );
  }
}
