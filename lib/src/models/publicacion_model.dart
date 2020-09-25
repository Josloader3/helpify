import 'dart:collection';
import 'dart:convert';
import 'ong_model.dart';

class Publicaciones{
  List<Publicacion> publicaciones = new List();

  Publicaciones.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    jsonList.forEach((item) {
      final publicacion = Publicacion.fromJson(item);
      publicaciones.add(publicacion);
    });

  }
}

Publicacion publicacionFromJson(String str) => Publicacion.fromJson(json.decode(str));

String publicacionToJson(Publicacion data) => json.encode(data.toJson());

class Publicacion {
  Publicacion({
    this.id,
    this.titulo,
    this.descripcion,
    this.fechaIni,
    this.fechaFin,
    this.meta,
    this.estado,
    this.ong,
  });

  String id;
  String titulo;
  String descripcion;
  String fechaIni;
  String fechaFin;
  int meta;
  String estado;
  Ong ong;

  factory Publicacion.fromJson(Map<String, dynamic> json) => Publicacion(
    //id: json["id"].toString(),
    titulo: json["titulo"],
    descripcion: json["descripcion"],
    fechaIni: json["fecha_ini"],
    fechaFin: json["fecha_fin"],
    meta: json["meta"],
    estado: json["estado"].toString(),
    ong: Ong.fromJson(HashMap.from(json["ong"])),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "descripcion": descripcion,
    "fecha_ini": fechaIni,
    "fecha_fin": fechaFin,
    "meta": meta,
    "estado": estado,
    "ong": ong.toJson(),
  };
}