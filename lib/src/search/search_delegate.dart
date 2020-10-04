import 'package:flutter/material.dart';

class DateSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // acciones que se muestran en el appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // crear resultados que se muestran
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Las sugerenciasque aparecen all escribir
    return Container();
  }
}
