import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:helpify/src/models/tipo_pago_model.dart';
import 'package:rxdart/rxdart.dart';

class TipoPagoBloc {
  DatabaseReference _tipoPagoReference = FirebaseDatabase.instance.reference().child("tipo_pago");
  final _tipoPagosController = new BehaviorSubject<List<TipoPago>>();

  Stream<List<TipoPago>> get tipoPagoStream => _tipoPagosController.stream;

  TipoPagoBloc(){
    _tipoPagoReference.onValue.listen((event) {
      List<dynamic> rawList = event.snapshot.value;
      final List<TipoPago> tipoPagos = new List();
      for (var x = 0; x < rawList.length; x++) {
        TipoPago tipoPago = TipoPago.fromJson(HashMap.from(rawList[x]));
        tipoPago.id = x;
        tipoPagos.add(tipoPago);
      }
      _tipoPagosController.sink.add(tipoPagos);
    }).onError((error){
      _tipoPagosController.sink.add(error);
    });
  }

  void dispose(){
    _tipoPagosController?.close();
  }


}