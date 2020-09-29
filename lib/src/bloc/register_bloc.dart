import 'dart:async';

import 'package:helpify/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators{

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _repeatPasswordController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _cellphoneController = BehaviorSubject<String>();

  //Insertar Valores al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeRepeatPassword => _repeatPasswordController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;
  Function(String) get changeCellphone => _cellphoneController.sink.add;

  // Recuperar los datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  Stream<String> get repeatPasswordStream => _repeatPasswordController.stream.transform(validarRepeatPassword);
  Stream<String> get nameStream => _nameController.stream.transform(validarName);
  Stream<String> get lastNameStream => _lastNameController.stream.transform(validarName);
  Stream<String> get cellphoneStream => _cellphoneController.stream.transform(validarCellphone);

  //Validar el formulario
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);
  Stream<String> get concatEmailPassword  =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => e + " " + p);


  //Obtener el último valor ingresado en los Stream
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  String get repeatPassword => _repeatPasswordController.value;
  String get name => _nameController.value;
  String get lastName => _lastNameController.value;
  String get cellphone => _cellphoneController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
    _repeatPasswordController?.close();
    _nameController?.close();
    _lastNameController?.close();
    _cellphoneController?.close();
  }


}