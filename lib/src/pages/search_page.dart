import 'package:flutter/material.dart';
import 'package:helpify/src/search/search_delegate.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: ,
      body: Container(
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.amber,
              offset: Offset(0.0, 2.0),
              //blurRadius: 6.0,
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch(
                    context: context, delegate: DateSearch(), query: ""))),
      ),
    );
  }
}
