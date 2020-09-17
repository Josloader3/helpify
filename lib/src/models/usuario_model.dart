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
    this.correo,
    this.imgPerfil,
    this.loginId,
  });

  int id;
  String nombres;
  String apellidos;
  int genero;
  String telefono;
  String correo;
  String imgPerfil;
  int loginId;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json["id"],
    nombres: json["nombres"],
    apellidos: json["apellidos"],
    genero: json["genero"],
    telefono: json["telefono"],
    correo: json["correo"],
    imgPerfil: json["img_perfil"],
    loginId: json["login_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombres": nombres,
    "apellidos": apellidos,
    "genero": genero,
    "telefono": telefono,
    "correo": correo,
    "img_perfil": imgPerfil,
    "login_id": loginId,
  };
}