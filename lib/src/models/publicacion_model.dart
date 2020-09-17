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
    this.ongId,
    this.estado,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.ong,
  });

  int id;
  String titulo;
  String descripcion;
  String fechaIni;
  String fechaFin;
  int meta;
  int ongId;
  String estado;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Ong ong;

  factory Publicacion.fromJson(Map<String, dynamic> json) => Publicacion(
    id: json["id"],
    titulo: json["titulo"],
    descripcion: json["descripcion"],
    fechaIni: json["fecha_ini"],
    fechaFin: json["fecha_fin"],
    meta: json["meta"],
    ongId: json["ong_id"],
    estado: json["estado"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    ong: Ong.fromJson(json["ong"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "descripcion": descripcion,
    "fecha_ini": fechaIni,
    "fecha_fin": fechaFin,
    "meta": meta,
    "ong_id": ongId,
    "estado": estado,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "ong": ong.toJson(),
  };
}