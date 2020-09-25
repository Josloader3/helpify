import 'package:flutter/cupertino.dart';
import 'package:helpify/src/bloc/publicaciones_bloc.dart';
import 'package:helpify/src/bloc/publicaciones_firebase_bloc.dart';

class Provider extends InheritedWidget {

  static Provider _instancia;

  factory Provider({Key key, Widget child}){
    if(_instancia == null){
      _instancia = Provider._internal(key: key, child:child);
    }
    return _instancia;
  }

  Provider._internal({ Key key, Widget child })
      : super(key: key, child:child);

  final _publicacionesBloc = PublicacionesBloc();
  final publicacionesFirebaseBloc = PublicacionesFirebaseBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Provider of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>() ;
  }

  static PublicacionesBloc publicacionesBloc (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>()._publicacionesBloc ;
  }

}