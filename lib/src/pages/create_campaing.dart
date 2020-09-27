import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class campaing extends StatelessWidget {
  const campaing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          "Helpify",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontFamily: "Bukhari",
          ),
        ),
        centerTitle: true,
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: NetworkImage(
                          'https://image.freepik.com/vector-gratis/concepto-apoyo-ilustracion-personas-voluntarias-planas-pequenas-donacion-tarro-que-recoge-simbolos-corazon-mano-que-da-campana-ayuda-solidaria-sensibilizacion-social-generosa-comunidad-personas-art_126608-604.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.camera),
                            iconSize: 30.0,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: Icon(Icons.photo_album),
                            iconSize: 30.0,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    _createName(),
                    _creategoal(),
                    _emailTextField(context),
                    _createButton(),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _creategoal() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Meta(S/.)",
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Nombre de la campaña",
      ),
    );
  }
}

Widget _createButton() {
  return RaisedButton.icon(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: Color(0xFFFFDB15),
    icon: Icon(Icons.schedule),
    onPressed: () {},
    label: Text("Publicar"),
  );
}

Widget _emailTextField(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
    child: TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        icon: Icon(Icons.text_fields),
        labelText: "Descripción",
      ),
    ),
  );
}
