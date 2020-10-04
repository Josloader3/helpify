import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:helpify/src/pages/feed_page.dart';
import 'package:helpify/src/pages/inbox_page.dart';
import 'package:helpify/src/pages/search_page.dart';
import 'package:helpify/src/pages/settings_page.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    //Container(),
    FeedPage(),
    SearchPage(),
    InboxPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Helpify",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
            fontFamily: "Bukhari",
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "profile");
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"),
                radius: 22,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Color(0xFFFFDB15),
              tabs: [
                GButton(
                  icon: LineAwesomeIcons.home,
                  text: 'Inicio',
                ),
                GButton(
                  icon: LineAwesomeIcons.search,
                  text: 'Buscar',
                ),
                GButton(
                  icon: LineAwesomeIcons.inbox,
                  text: 'Mensajes',
                ),
                GButton(
                  icon: LineAwesomeIcons.gear,
                  text: 'Ajustes',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
