import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:helpify/src/models/publicacion_model.dart';
import 'package:rxdart/rxdart.dart';

class PublicacionesFirebaseBloc{

  DatabaseReference _publicacionesReference = FirebaseDatabase.instance.reference().child("publicaciones");
  final _publicacionesController = new BehaviorSubject<List<Publicacion>>();

  Stream<List<Publicacion>> get publicacionesStream => _publicacionesController.stream;

  PublicacionesFirebaseBloc(){
    _publicacionesReference.onValue.listen((event) {
      Map<String, dynamic> decodedData = HashMap.from(event.snapshot.value);
      final List<Publicacion> publicaciones = new List();
      decodedData.forEach((id, item) {
        if(id == "1"){
          final publicacion = Publicacion.fromJson(HashMap.from(item));
          publicacion.id = id;
          publicaciones.add(publicacion);
        }
      });
      _publicacionesController.sink.add(publicaciones);
    }).onError((error){
      _publicacionesController.sink.add(error);
    });
  }

  void dispose(){
    _publicacionesController?.close();
  }
}