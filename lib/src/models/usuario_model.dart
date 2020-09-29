import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.id,
    this.nombres,
    this.apellidos,
    this.genero,
    this.telefono,
    this.imgPerfil,
  });

  String id;
  String nombres;
  String apellidos;
  int genero;
  String telefono;
  String imgPerfil;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json["id"],
    nombres: json["nombres"],
    apellidos: json["apellidos"],
    genero: json["genero"],
    telefono: json["telefono"],
    imgPerfil: json["img_perfil"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombres": nombres,
    "apellidos": apellidos,
    "genero": genero,
    "telefono": telefono,
    "img_perfil": imgPerfil,
  };
}