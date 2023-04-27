import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travo_app_demo/core/helpers/local_storage_helper.dart';
import 'package:travo_app_demo/routes.dart';

import 'app.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.rubikTextTheme()),
      debugShowCheckedModeBanner: false,
      home: const Directional(),
      routes: routes,
    );
  }
}
