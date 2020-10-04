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
    this.logo
  });

  int id;
  String empresa;
  String logo;

  factory TipoPago.fromJson(Map<String, dynamic> json) => TipoPago(
    id: json["id"],
    empresa: json["empresa"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "empresa": empresa,
    "logo": logo,
  };
}