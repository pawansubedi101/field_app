import 'dart:io';

import 'package:field_app/router.dart';
import 'package:field_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/http_overrides.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Field App',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme: GoogleFonts.poppinsTextTheme()),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const LoginScreen());
  }
}
