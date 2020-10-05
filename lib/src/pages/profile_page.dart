import 'package:flutter/material.dart';
import 'package:helpify/src/bloc/perfil_bloc.dart';
import 'package:helpify/src/bloc/provider.dart';
import 'package:helpify/src/models/donacion_model.dart';
import 'package:helpify/src/shared_prefs/preferencias_usuario.dart';
import 'package:helpify/src/widgets/cabecera_widget.dart';

class ProfilePage extends StatelessWidget {
  final pref = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    final perfilBloc = Provider.of(context).perfilBloc;
    perfilBloc.getDonaciones(pref.idLogin);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.amber,
                  child: Container(
                    width: double.infinity,
                    height: 350.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CabeceraWidget(
                            titulo: "Perfil",
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://img2.freepng.es/20180920/yko/kisspng-computer-icons-portable-network-graphics-avatar-ic-5ba3c66df14d32.3051789815374598219884.jpg",
                            ),
                            radius: 50.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 22.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Campañas\napoyadas",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "5200",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Donación\ntotal",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "28.5K",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Donaciones:",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 28.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 400.0,
                          child: _crearListaDonaciones(perfilBloc)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearListaDonaciones(PerfilBloc perfilBloc) {
    return StreamBuilder(
      stream: perfilBloc.donacionStream,
      builder: (context, snapshot){
        if (snapshot.hasData) {
          final donaciones = snapshot.data;
          return ListView.builder(
              itemCount: donaciones.length,
              itemBuilder: (context, index) => _createItem(
                  context, donaciones[index]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _createItem(BuildContext context, Donacion donacion) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "publicacion", arguments: donacion.publicacion),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                donacion.publicacionId,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(
                donacion.monto,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
