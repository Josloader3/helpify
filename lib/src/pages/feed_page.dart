import 'package:flutter/material.dart';
import 'package:helpify/src/bloc/provider.dart';
import 'package:helpify/src/bloc/publicaciones_firebase_bloc.dart';
import 'package:helpify/src/models/publicacion_model.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';

class FeedPage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context).publicacionesFirebaseBloc;

    return Scaffold(
      body: _createListPublicaciones(bloc),
      floatingActionButton: _addButton(context),
    );
  }

  Widget _createListPublicaciones(
      PublicacionesFirebaseBloc publicacionesFirebaseBloc) {
    return StreamBuilder<List<Publicacion>>(
        stream: publicacionesFirebaseBloc.publicacionesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final publicaciones = snapshot.data;
            return ListView.builder(
                itemCount: publicaciones.length,
                itemBuilder: (context, index) => _createItem(
                    context, publicaciones[index], publicacionesFirebaseBloc));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _addButton(BuildContext context) {
    if (prefs.rol == 2) {
      return FloatingActionButton(
          //Que el botón solo funcione si entras como ONG
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "campana");
          });
    }
    return null;
  }

  Widget _createItem(BuildContext context, Publicacion publicacion,
      PublicacionesFirebaseBloc publicacionesFirebaseBloc) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "post", arguments: publicacion),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Text(
                  "no image") /* Image.network(publicacion.fotoscampaingUrl)*/,
            ),
            ListTile(
              title: Text(publicacion.titulo),
              subtitle: Text(publicacion.descripcion),
            ),
          ],
        ),
      ),
    );
  }
}
