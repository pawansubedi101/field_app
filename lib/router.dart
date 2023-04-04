import 'package:field_app/screens/home_screen.dart';
import 'package:field_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) {
          return const LoginScreen();
        },
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) {
          return const HomeScreen(
            username: '',
            password: '',
            ticketId: '',
          );
        },
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("Screen does not exit !"),
            ),
          );
        },
      );
  }
}
