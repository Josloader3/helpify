import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:helpify/src/models/ong_model.dart';
import 'package:helpify/src/models/publicacion_model.dart';
import 'package:rxdart/rxdart.dart';

class PublicacionesFirebaseBloc{

  DatabaseReference _publicacionesReference = FirebaseDatabase.instance.reference().child("publicaciones");
  final _publicacionesController = new BehaviorSubject<List<Publicacion>>();
  final _publicacionController = new BehaviorSubject<Ong>();

  Stream<List<Publicacion>> get publicacionesStream => _publicacionesController.stream;
  Stream<Ong> get publicacionStream => _publicacionController.stream;

  PublicacionesFirebaseBloc(){
    _publicacionesReference.onValue.listen((event) {
      Map<String, dynamic> decodedData = HashMap.from(event.snapshot.value);
      final List<Publicacion> publicaciones = new List();
      decodedData.forEach((id, item) {
        final publicacion = Publicacion.fromJson(HashMap.from(item));
        publicacion.id = id;
        publicaciones.add(publicacion);
      });
      _publicacionesController.sink.add(publicaciones);
    }).onError((error){
      _publicacionesController.sink.add(error);
    });
  }

  getOng(String idOng){
    DatabaseReference _ongReference  = FirebaseDatabase.instance.reference().child("ongs").child(idOng);
    _ongReference.onValue.listen((event) {
      Map<String, dynamic> decodedData = HashMap.from(event.snapshot.value);
      Ong ong = Ong.fromJson(decodedData);
      _publicacionController.sink.add(ong);
    }).onError((error){
      _publicacionController.sink.add(error);
    });
  }

  void dispose(){
    _publicacionesController?.close();
    _publicacionController?.close();
  }
}