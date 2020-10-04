import 'dart:convert';

import 'package:helpify/src/models/publicacion_model.dart';
import 'package:helpify/src/models/tipo_pago_model.dart';
import 'package:helpify/src/models/usuario_model.dart';

Donacion donacionFromJson(String str) => Donacion.fromJson(json.decode(str));

String donacionToJson(Donacion data) => json.encode(data.toJson());

class Donacion {
  Donacion({
    this.id,
    this.publicacionId,
    this.usuarioId,
    this.tipoPagoId,
    this.monto,
    this.publicacion,
    this.usuario,
    this.tipoPago
  });

  String id;
  String publicacionId;
  String usuarioId;
  int tipoPagoId;
  String monto;
  Publicacion publicacion;
  Usuario usuario;
  TipoPago tipoPago;

  factory Donacion.fromJson(Map<String, dynamic> json) => Donacion(
    id: json["id"],
    publicacionId: json["publicacion_id"],
    usuarioId: json["usuario_id"],
    tipoPagoId: json["tipo_pago_id"],
    monto: json["monto"],
    publicacion: Publicacion.fromJson(json["publicacion"]),
    usuario: Usuario.fromJson(json["usuario"]),
    tipoPago: TipoPago.fromJson(json["tipoPago"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "publicacion_id": publicacionId,
    "usuario_id": usuarioId,
    "tipo_pago_id": tipoPagoId,
    "monto": monto
  };
}
