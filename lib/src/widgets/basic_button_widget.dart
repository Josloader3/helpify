import 'package:flutter/material.dart';

class BasicButtonWidget extends StatelessWidget {

  final String text;
  final String type;
  final Function func;

  BasicButtonWidget(String this.text, String this.type, Function this.func, {Key key});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text(text, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      color: (type=="primary")?Color(0xFFFFDB15):Color(0xFFFF5722),
      textColor: Colors.black,
      onPressed: func,
    );
  }
}
