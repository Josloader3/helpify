import 'package:flutter/material.dart';
import 'package:helpify/src/bloc/provider.dart';
import 'package:helpify/src/bloc/publicaciones_firebase_bloc.dart';
import 'package:helpify/src/models/ong_model.dart';
import 'package:helpify/src/models/publicacion_model.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Publicacion publicacionData = ModalRoute.of(context).settings.arguments;
    final bloc = Provider.of(context).publicacionesFirebaseBloc;
    bloc.getOng(publicacionData.idOng);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CabeceraWidget(titulo: "${ publicacionData.titulo }",),
              _crearCarrusel(),
              Text("${ publicacionData.descripcion }"),
              _cargarOng(bloc),
              _crearButton(context, publicacionData),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFB8E2FF),
    );
  }

  Widget _crearCarrusel() {
    return Container(
      height: 200,
    );
  }

  Widget _cargarOng(PublicacionesFirebaseBloc publicacionesFirebaseBloc){
    return StreamBuilder<Ong>(
        stream: publicacionesFirebaseBloc.publicacionStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _crearCardOng(context, snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _crearCardOng(BuildContext context, Ong ong) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "ong", arguments: ong),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                LineAwesomeIcons.arrow_circle_left,
                size: 70.0,
              ),
              title: Text(
                ong.nombre,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              subtitle: Text(
                ong.descripcion,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearButton(BuildContext context, Publicacion publicacionData) {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: Text("Hacer donación"),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        color: Color(0xFFFFDB15),
        textColor: Colors.black,
        onPressed: () => Navigator.pushNamed(context, "payment", arguments: publicacionData),
    );
  }
  
}
