import 'package:rxdart/rxdart.dart';

class PaymentBloc{

  final _idTipoPagoSelectedController = BehaviorSubject<int>();
  final _montoController = BehaviorSubject<String>();

  Function(int) get changeIdTipoPagoSelected => _idTipoPagoSelectedController.sink.add;
  Function(String) get changeMonto => _montoController.sink.add;

  Stream<int> get idTipoPagoSelectedStream => _idTipoPagoSelectedController.stream;
  Stream<int> get montoStream => _idTipoPagoSelectedController.stream;

  int get idTipoPago => _idTipoPagoSelectedController.value;
  String get monto => _montoController.value;

  void dispose(){
    _idTipoPagoSelectedController?.close();
    _montoController?.close();
  }
}