import 'dart:convert';

class TipoPagos{
  List<TipoPago> tipoPagos = new List();

  TipoPagos.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    jsonList.forEach((item) {
      final tipoPago = TipoPago.fromJson(item);
      tipoPagos.add(tipoPago);
    });

  }
}

TipoPago tipoPagoFromJson(String str) => TipoPago.fromJson(json.decode(str));

String tipoPagoToJson(TipoPago data) => json.encode(data.toJson());

class TipoPago {
  TipoPago({
    this.id,
    this.empresa,
    this.icono,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String empresa;
  String icono;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory TipoPago.fromJson(Map<String, dynamic> json) => TipoPago(
    id: json["id"],
    empresa: json["empresa"],
    icono: json["icono"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "empresa": empresa,
    "icono": icono,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}