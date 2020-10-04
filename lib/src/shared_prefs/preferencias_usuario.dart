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

}