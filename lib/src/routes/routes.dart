import 'package:flutter/material.dart';
import 'package:helpify/src/pages/splash_page.dart';

Map<String, WidgetBuilder> getRoutesMaterial() => {
  "/" : (BuildContext context) => SplashPage(),
};