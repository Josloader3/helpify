import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SettingsPage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("Notificaciones"),
          leading: Icon(Icons.notifications),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text("Chats"),
          leading: Icon(Icons.chat),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text("Métodos de pago"),
          leading: Icon(Icons.payment),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pushNamed(context, "tarjetas");
          },
        ),
        Divider(),
        ListTile(
          title: Text("Cerrar Sesión"),
          leading: Icon(Icons.close),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => {
            _cerrarSesion(context)
          },
        ),
        Divider(),
        Text(
          "Hecho con <3 en Flutter.",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _cerrarSesion(BuildContext context) async {
    prefs.idLogin = "";
    prefs.rol = 0;
    await _auth.signOut();

    Navigator.of(context).pushNamedAndRemoveUntil('choose_role', (Route<dynamic> route) => false);
  }
}
