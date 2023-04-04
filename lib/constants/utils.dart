import 'dart:developer';

import 'package:field_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void showSnackbar(BuildContext context, String text) {
  final ScaffoldMessengerState scaffold = globalScaffoldKey.currentState!;
  scaffold.showSnackBar(SnackBar(content: Text(text)));
}

Widget showErrorAlertDialog(BuildContext context) {
  return AlertDialog(
    icon: Icon(
      Icons.error,
      color: Colors.red.shade500,
      size: 50,
    ),
    title: const Text("Invalid Credentials"),
    content: const Text("Username or password is incorrect."),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('OK'),
      ),
    ],
  );
}

Widget noInternetAlertDialog(BuildContext context) {
  return AlertDialog(
    icon: Icon(
      Icons.wifi_off,
      color: Colors.red.shade500,
      size: 50,
    ),
    title: const Text("No internet Connection."),
    content: const Text("Please connect to the internet"),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('OK'),
      ),
    ],
  );
}

Widget showLoading(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: SpinKitCircle(
        color: Colors.white,
        size: 80.0,
      ),
    ),
  );
}

String getGreetingText() {
  final hour = DateTime.now().hour;
  if (hour >= 0 && hour < 12) {
    return "Good Morning  ☕🙂";
  } else if (hour >= 12 && hour < 18) {
    return "Good afternoon ☀️🙂";
  } else {
    return "Good evening 🌃🙂";
  }
}

Future<dynamic> showSignInAlertDialog(
  BuildContext context,
) {
  TextEditingController controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        alignment: Alignment.center,
        contentPadding: const EdgeInsets.all(0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "SIGN In NOTE",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: controller,
                  maxLines: 5,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    log(controller.text);
                    Navigator.pop(context);
                  },
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.black26,
                    child: Container(
                      height: 40,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.green, Colors.greenAccent]),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<dynamic> showSignOutAlertDialog(BuildContext context) {
  TextEditingController controller = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        alignment: Alignment.center,
        contentPadding: const EdgeInsets.all(0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "SIGN Out NOTE",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: controller,
                  maxLines: 5,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    log(controller.text);
                    Navigator.pop(context);
                  },
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.black26,
                    child: Container(
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red.shade700, Colors.red.shade200]),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    },
  );
}
