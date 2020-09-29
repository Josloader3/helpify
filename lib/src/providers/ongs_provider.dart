import 'dart:async';
import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:helpify/src/models/ong_model.dart';

class OngsProvider {

  Future<Ong> getOng(String idOng) async {
    DatabaseReference _ongReference  = FirebaseDatabase.instance.reference().child("ongs").child(idOng);
    DataSnapshot data = await _ongReference.once();
    print(data.value);
    return data.value;
  }

}