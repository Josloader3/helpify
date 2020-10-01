import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
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
        Text(
          "Hecho con <3 en Flutter.",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
