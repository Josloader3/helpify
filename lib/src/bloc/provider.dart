import 'package:flutter/cupertino.dart';
import 'package:helpify/src/bloc/login_bloc.dart';
import 'package:helpify/src/bloc/payment_bloc.dart';
import 'package:helpify/src/bloc/publicaciones_firebase_bloc.dart';
import 'package:helpify/src/bloc/register_bloc.dart';
import 'package:helpify/src/bloc/register_ong_bloc.dart';
import 'package:helpify/src/bloc/tipo_pago_bloc.dart';

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
  final registerBloc = RegisterBloc();
  final registerOngBloc = RegisterOngBloc();
  final loginBloc = LoginBloc();
  final publicacionesFirebaseBloc = PublicacionesFirebaseBloc();
  final tipoPagoBloc = TipoPagoBloc();
  final paymentBloc = PaymentBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Provider of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>() ;
  }

}