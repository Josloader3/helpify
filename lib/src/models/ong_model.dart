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

  factory Ong.fromJson(Map<String, dynamic> json) => Ong(
    id: json["id"],
    nombre: json["nombre"],
    razonSocial: json["razon_social"],
    ruc: json["ruc"].toString(),
    descripcion: json["descripcion"],
    web: json["web"],
    correo: json["correo"],
    imgPerfil: json["img_perfil"],
    imgFondo: json["img_fondo"],
    loginId: json["login_id"],
    estado: json["estado"],
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
  };
}