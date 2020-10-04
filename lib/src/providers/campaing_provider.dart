import 'dart:convert';

import 'package:helpify/src/models/publicacion_model.dart';
import 'package:http/http.dart' as http;

class CampaingProvider {
  String _url = "https://helpify-8d65d.firebaseio.com";
  String query = "titulo";

  Future<bool> createCampaing(Publicacion publicacion) async {
    final url = "$_url/publicaciones.json";
    final resp = await http.post(url, body: publicacionToJson(publicacion));
    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  /*Future<List<bool>> searchCampaing(Publicacion publicacion) async {
    final url = Uri.http(_url, "/publicaciones.json",{
      "query":query,
    });
    return _procesarRespuesta(url);
  }*/
}
