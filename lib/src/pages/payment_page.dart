import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helpify/src/bloc/payment_bloc.dart';
import 'package:helpify/src/bloc/provider.dart';
import 'package:helpify/src/bloc/tipo_pago_bloc.dart';
import 'package:helpify/src/models/donacion_model.dart';
import 'package:helpify/src/models/publicacion_model.dart';
import 'package:helpify/src/models/tipo_pago_model.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';
import 'package:helpify/src/widgets/basic_button_widget.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';
import 'package:uuid/uuid.dart';

class PaymentPage extends StatelessWidget {
  final fDB = FirebaseDatabase.instance;
  final prefs = new PreferenciasUsuario();
  Publicacion publicacionData;

  @override
  Widget build(BuildContext context) {
    publicacionData = ModalRoute.of(context).settings.arguments;
    final blocTipoPago = Provider.of(context).tipoPagoBloc;
    final blocPayment = Provider.of(context).paymentBloc;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CabeceraWidget(
                titulo: "Método\nde pago",
              ),
              SizedBox(height: 30),
              Container(
                  height: 300.0,
                  child: _crearListaTipoPago(blocTipoPago, blocPayment)
              ),
              SizedBox(height: 30),
              _crearFormMonto(blocPayment),
              SizedBox(height: 30),
              BasicButtonWidget("DONAR", "primary", () => {
                _guardarDonacion(blocPayment)
              }),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFD4A3FF),
    );
  }

  Widget _crearListaTipoPago(TipoPagoBloc tipoPagoBloc, PaymentBloc paymentBloc) {
    return StreamBuilder<List<TipoPago>>(
      stream: tipoPagoBloc.tipoPagoStream,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            final tipoPagos = snapshot.data;
            return ListView.builder(
              itemCount: tipoPagos.length,
              itemBuilder: (context, index) => _createItem(
                context, tipoPagos[index], paymentBloc
              )
            );
          }
          return Center(child: CircularProgressIndicator());
        }
    );
  }

  Widget _crearFormMonto(PaymentBloc paymentBloc) {
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: paymentBloc.montoStream,
          builder: (context, snapshot){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  labelText: "Monto",
                ),
                onChanged: paymentBloc.changeMonto,
              ),
            );
          },
        )
      ],
    );
  }

  _createItem(BuildContext context, TipoPago tipoPago, PaymentBloc bloc) {
    /*return Radio(
      value: tipoPago.id,
      groupValue: 0,
      onChanged: null,
    );*/
    return StreamBuilder(
      stream: bloc.idTipoPagoSelectedStream,
      builder: (context, snapshot){
        return Container(
          height: 60.0,
          child: RadioListTile(
              value: tipoPago.id,
              groupValue: bloc.idTipoPago,
              title: Text(tipoPago.empresa),
              onChanged: bloc.changeIdTipoPagoSelected,
              activeColor: Colors.red,
              secondary: Image.network(tipoPago.logo)
            //selected: true,
          ),
        );
      },
    );
  }

  _guardarDonacion(PaymentBloc paymentBloc){
    print("/////////////////////////////////////////");
    print(paymentBloc.idTipoPago);
    print(paymentBloc.monto);
    print("/////////////////////////////////////////");

    Uuid uuid = Uuid();
    String uID = uuid.v1();

    Donacion donacion = Donacion();
    donacion.id = uID;
    donacion.tipoPagoId = paymentBloc.idTipoPago;
    donacion.monto = paymentBloc.monto;
    donacion.publicacionId = publicacionData.id;
    donacion.usuarioId = prefs.idLogin;

    fDB.reference().child("donaciones").child(uID).set(donacion.toJson()).then((onValue) {
      print("Donacion Completa!!!");
    }).catchError((onError) {
      print("ERROR: " + onError.toString());
    });

  }
}
