import 'package:flutter/material.dart';
import 'package:travo_app_demo/representation/screens/home_screen.dart';
import 'package:travo_app_demo/representation/screens/intro_screen.dart';
import 'package:travo_app_demo/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routerName: (context) => const IntroScreen(),
  // ignore: equal_keys_in_map
  HomeScreen.routerName: (context) => const HomeScreen(),
};
