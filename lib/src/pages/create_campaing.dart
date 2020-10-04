import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpify/src/models/publicacion_model.dart';
import 'package:helpify/src/providers/campaing_provider.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';
import 'package:helpify/src/utils/utils.dart';

class campaing extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Publicacion _publicacion = new Publicacion();

  final _campaingProvider = new CampaingProvider();
  final prefs = new PreferenciasUsuario();

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
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _createName(),
                        _creategoal(),
                        _descriptionField(),
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
      initialValue: _publicacion.meta.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Meta(S/.)",
      ),
      onSaved: (value) => _publicacion.meta = int.parse(value),
      validator: (value) {
        if (isNumeric(value)) {
          return null;
        } else {
          return "Solo numeros";
        }
      },
    );
  }

  Widget _createName() {
    return TextFormField(
      initialValue: _publicacion.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Nombre de la campaña",
      ),
      onSaved: (value) {
        _publicacion.titulo = value;
        _publicacion.idOng = prefs.idLogin;
      },
      validator: (value) {
        if (value.trim().length < 3) {
          return "Ingrese el nombre de la campaña";
        } else {
          return null;
        }
      },
    );
  }

  Widget _createButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color(0xFFFFDB15),
      icon: Icon(Icons.schedule),
      label: Text("Publicar"),
      onPressed: _summit,
    );
  }

  Widget _descriptionField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            icon: Icon(Icons.text_fields),
            labelText: "Descripción",
          ),
          onSaved: (value) => _publicacion.descripcion = value,
          validator: (value) {
            if (value.trim().length < 3) {
              return "Ingrese el descripción de la campaña";
            } else {
              return null;
            }
          }),
    );
  }

  void _summit() {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    print("Todo Ok");
    print(_publicacion.idOng);

    _campaingProvider.createCampaing(_publicacion);
  }
}
