import 'dart:async';

import 'package:helpify/src/models/publicacion_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PublicacionesProvider {

  String _token = "VTOcuCjo01fNxbqjdfB8LXIwYswEC0IwkdNNpNbDOK5SPWlyXHXJD65bjvYw";
  String _url = "192.168.1.8:8000";


  Future<List<Publicacion>> getPublicaciones() async{
    final url = Uri.http(_url, "api/publicacion", {
        //params
    });
    final resp = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    });
    final decodedData = json.decode(resp.body);
    final listaPublicaciones = new Publicaciones.fromJsonList(decodedData);
    print(listaPublicaciones.publicaciones[0].titulo);
    return listaPublicaciones.publicaciones;
  }
}