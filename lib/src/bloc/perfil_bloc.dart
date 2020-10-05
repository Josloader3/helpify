import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:helpify/src/models/donacion_model.dart';
import 'package:rxdart/rxdart.dart';

class PerfilBloc{
  DatabaseReference _donacionesReference = FirebaseDatabase.instance.reference().child("donaciones");
  final _donacionesController = new BehaviorSubject<List<Donacion>>();

  Stream<List<Donacion>> get donacionStream => _donacionesController.stream;

  PerfilBloc();

  getDonaciones(String idUser){
    _donacionesReference.onValue.listen((event) {
      Map<String, dynamic> decodedData = HashMap.from(event.snapshot.value);
      final List<Donacion> donaciones = new List();
      decodedData.forEach((id, item) {
        final donacion = Donacion.fromJson(HashMap.from(item));
        if(idUser == donacion.usuarioId){
          donacion.id = id;
          donaciones.add(donacion);
        }
      });
      _donacionesController.sink.add(donaciones);
    }).onError((error){
      _donacionesController.sink.add(error);
    });
  }


  void dispose(){
    _donacionesController?.close();
  }
}