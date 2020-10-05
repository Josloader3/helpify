import 'dart:convert';

import 'package:helpify/src/models/ong_model.dart';
import 'package:helpify/src/models/usuario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() => _instancia;

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  get idLogin {
    return _prefs.getString("idLogin") ?? "";
  }

  set idLogin (String value){
    _prefs.setString("idLogin", value);
  }

  get rol {
    return _prefs.getInt("rol") ?? 0;
  }

  set rol (int value){
    _prefs.setInt("rol", value);
  }

  get usuario {
    return Usuario.fromJson(json.decode(_prefs.getString("usuario")));
  }

  set usuario (Usuario usuario){
    _prefs.setString("usuario", json.encode(usuario));
  }

  get ong {
    return Ong.fromJson(json.decode(_prefs.getString("ong")));
  }

  set ong (Ong ong){
    _prefs.setString("ong", json.encode(ong));
  }
}