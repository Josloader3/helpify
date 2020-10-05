import 'dart:convert';
import 'dart:io';

import 'package:helpify/src/models/publicacion_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

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

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/dntttfahc/:image/upload_preset=o0plgpxa");
    final mimeType = mime(image.path).split("/"); // image/jpeg

    final imageUploadRequest = http.MultipartRequest("POST", url);
    final file = await http.MultipartFile.fromPath("file", image.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    http.StreamedResponse streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print("Algo salió mal");
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);

    return respData["secure_url"];
  }

  editCampaing(Publicacion publicacion) async {
    final url = "$_url/publicaciones/${publicacion.id}.json";
    final resp = await http.post(url, body: publicacionToJson(publicacion));
    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  /*Future<List<bool>> searchCampaing(Publicacion publicacion) async {
    final url = Uri.http(_url, "/publicaciones.json",{
      "titulo":query,
    });
    return _procesarRespuesta(url);
  }*/
}
