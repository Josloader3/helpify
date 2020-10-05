import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:helpify/src/models/donacion_model.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';
import 'package:rxdart/rxdart.dart';

class PerfilBloc{
  final prefs = new PreferenciasUsuario();
  DatabaseReference _donacionesReference = FirebaseDatabase.instance.reference().child("donaciones");
  final _donacionesController = new BehaviorSubject<List<Donacion>>();

  Stream<List<Donacion>> get donacionStream => _donacionesController.stream;

  PerfilBloc(){
    _donacionesReference.onValue.listen((event) {
      Map<String, dynamic> decodedData = HashMap.from(event.snapshot.value);
      final List<Donacion> donaciones = new List();
      decodedData.forEach((id, item) {
        final donacion = Donacion.fromJson(HashMap.from(item));
        if(prefs.idLogin == donacion.usuarioId){
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