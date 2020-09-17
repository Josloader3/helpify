import 'package:flutter/material.dart';
import 'package:helpify/src/pages/menu_page.dart';
import 'package:helpify/src/pages/ong_page.dart';
import 'package:helpify/src/pages/payment_page.dart';
import 'package:helpify/src/pages/post_page.dart';
import 'package:helpify/src/pages/registration_ONG_page.dart';
import 'package:helpify/src/pages/registration_page.dart';
import 'package:helpify/src/pages/splash_page.dart';

Map<String, WidgetBuilder> getRoutesMaterial() => {
  "/" : (BuildContext context) => MenuPage(),
  "splash": (BuildContext context)=> SplashScreen(),
  "registration": (BuildContext context)=> RegistrationPage(),
  "RegistrationONG": (BuildContext context)=> RegistrationONG(),
  "post": (BuildContext context)=> PostPage(),
  "ong": (BuildContext context)=> OngPage(),
  "payment": (BuildContext context)=> PaymentPage(),

};