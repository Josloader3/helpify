class Ong {
  Ong({
    this.id,
    this.nombre,
    this.razonSocial,
    this.ruc,
    this.descripcion,
    this.web,
    this.correo,
    this.imgPerfil,
    this.imgFondo,
    this.loginId,
    this.estado,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String nombre;
  String razonSocial;
  String ruc;
  String descripcion;
  String web;
  String correo;
  dynamic imgPerfil;
  dynamic imgFondo;
  int loginId;
  int estado;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Ong.fromJson(Map<String, dynamic> json) => Ong(
    id: json["id"],
    nombre: json["nombre"],
    razonSocial: json["razon_social"],
    ruc: json["ruc"],
    descripcion: json["descripcion"],
    web: json["web"],
    correo: json["correo"],
    imgPerfil: json["img_perfil"],
    imgFondo: json["img_fondo"],
    loginId: json["login_id"],
    estado: json["estado"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "razon_social": razonSocial,
    "ruc": ruc,
    "descripcion": descripcion,
    "web": web,
    "correo": correo,
    "img_perfil": imgPerfil,
    "img_fondo": imgFondo,
    "login_id": loginId,
    "estado": estado,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}