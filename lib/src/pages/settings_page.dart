import 'package:flutter/material.dart';

class Settings extends StatefulWidget {



  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var configuraciones = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFDB15),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Configuraciones',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18.0,
            color: Colors.white,
          )
        ),
        centerTitle: true,
      ),
      body:ListView(children: [
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height-82.0,
            width: MediaQuery.of(context).size.width,
            color:Colors.transparent
          ),
          Positioned(
              top: 75.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height-100.0,
                width: MediaQuery.of(context).size.width,
              ),
          ),
          Positioned(
              top: 30.0,
              left: (MediaQuery.of(context).size.width/2)-100.0,
              child: Hero(
              tag: widget.heroTag,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.heroTag),
                      fit: BoxFit.cover
                  )
                ),
                height: 200.0,
                width: 200.0,
              )
              )
          ),
          Positioned(
            top: 250.0,
            left: 25.0,
            right: 25.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text(widget.foodname,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
                ),
                Container(
                  height: 25.0,
                  color: Colors.grey,
                  width: 1.0,
                ),
                Container(
                  width: 125.0,
                )
              ],
            ),
          ),
        ],)
      ],)
    );
  }
}
