import 'package:flutter/material.dart';
import 'package:helpify/src/pages/choose_optauth_page.dart';
import 'package:helpify/src/pages/choose_role_page.dart';
import 'package:helpify/src/pages/login_page.dart';
import 'package:helpify/src/pages/menu_page.dart';
import 'package:helpify/src/pages/ong_page.dart';
import 'package:helpify/src/pages/payment_page.dart';
import 'package:helpify/src/pages/post_page.dart';
import 'package:helpify/src/pages/profile_page.dart';
import 'package:helpify/src/pages/registration_ONG_page.dart';
import 'package:helpify/src/pages/registration_page.dart';
import 'package:helpify/src/pages/splash_page.dart';

Map<String, WidgetBuilder> getRoutesMaterial() => {
  "splash": (BuildContext context)=> SplashScreen(),
  "choose_role": (BuildContext context)=> ChooseRole(),
  "choose_optauth": (BuildContext context)=> ChooseOptAuthRole(),
  "login": (BuildContext context)=> LoginPage(),
  "menu" : (BuildContext context) => MenuPage(),
  "profile": (BuildContext context)=> ProfilePage(),
  "registration": (BuildContext context)=> RegistrationPage(),
  "registration_ong": (BuildContext context)=> RegistrationONG(),
  "post": (BuildContext context)=> PostPage(),
  "ong": (BuildContext context)=> OngPage(),
  "payment": (BuildContext context)=> PaymentPage(),

};