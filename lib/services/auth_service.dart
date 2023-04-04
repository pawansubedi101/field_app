import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/global_variables.dart';
import '../constants/utils.dart';
import '../screens/home_screen.dart';

class AuthService {
// sign in user
  Future signInUser(
      {required BuildContext context,
      required String phone,
      required String password,
      required String bearerToken}) async {
    try {
      Map<String, String> body = {'username': phone, 'password': password};

      http.Response res = await http.post(
        Uri.parse('$uri/api/Mobileapp/1'),
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $bearerToken',
        },
      );
      final Map<String, dynamic> decodedData = json.decode(res.body);

      if (decodedData['message'] == "login not successful") {
        log("error occured");
        showDialog(
          context: context,
          builder: (context) {
            return showErrorAlertDialog(context);
          },
        );
        return false;
      } else if (decodedData['message'] == "login successful") {
        log("going to another route");

        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomeScreen(
              username: phone,
              password: password,
              ticketId: decodedData['data'][0]['id'],
            );
          },
        ));
      }
    } catch (e) {
      log(e.toString());
      log("Something went wrong !!!");
      showDialog(
        context: context,
        builder: (context) {
          return noInternetAlertDialog(context);
        },
      );
    }
  }
}
