import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mis tarjetas",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                Navigator.pushNamed(context, "add_tarjetas");
              })
        ],
      ),
      body: SingleChildScrollView(),
    );
  }
}
