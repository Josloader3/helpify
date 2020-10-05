import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpify/src/models/publicacion_model.dart';
import 'package:helpify/src/providers/campaing_provider.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';
import 'package:helpify/src/utils/images.dart';
import 'package:helpify/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class CampaingPage extends StatefulWidget {
  CampaingPage({Key key}) : super(key: key);
  @override
  _CampaingPageState createState() => _CampaingPageState();
}

class _CampaingPageState extends State<CampaingPage> {
  final _formKey = GlobalKey<FormState>();
  Publicacion _publicacion = new Publicacion();

  final _campaingProvider = new CampaingProvider();
  final prefs = new PreferenciasUsuario();

  File _photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
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
                            onPressed: () {
                              _processImage(ImageSource.camera);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.photo_album),
                            iconSize: 30.0,
                            color: Colors.black,
                            onPressed: () {
                              _processImage(ImageSource.gallery);
                            },
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
                //padding: EdgeInsets.all(15.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _createName(),
                        _showPhoto(),
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

  void _summit() async {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    if (_photo != null) {
      _publicacion.fotoscampaingUrl =
          await _campaingProvider.uploadImage(_photo);
    }

    print("Todo Ok");
    print(_publicacion.idOng);

    if (_publicacion.id == null) {
      await _campaingProvider.createCampaing(_publicacion);
    } else {
      await _campaingProvider.editCampaing(_publicacion);
    }

    Navigator.pop(context);
  }

  void _processImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (_photo != null) {
      // TODO: Limpiar la url de la foto
    }
    setState(() {
      _photo = File(pickedFile.path);
    });
  }

  Widget _showPhoto() {
    if (_publicacion.fotoscampaingUrl != null) {
      return Container();
    } else {
      return Image(
        image:
            _photo != null ? FileImage(_photo) : AssetImage(MyImages.NO_IMAGE),
        height: 300,
        fit: BoxFit.cover,
      );
    }
  }
}
