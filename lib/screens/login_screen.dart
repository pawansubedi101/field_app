import 'dart:developer';

import 'package:field_app/services/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/global_variables.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/common/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  void loginUser() {
    _authService
        .signInUser(
            context: context,
            bearerToken: 'pratik',
            phone: _phoneController.text,
            password: _passwordController.text)
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void>? showAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Text("dfsa"),
        );
      },
    );
    return null;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: const Color.fromARGB(255, 73, 70, 70),
          ),
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 130),
                  child: Image.asset(appLogoUrl))),
          Container(
            padding: const EdgeInsets.only(top: 85),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Form(
                key: _loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextField(
                          prefixIcon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          hintText: "Phone No",
                          maxLines: 1),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          isPasswordField: true,
                          prefixIcon: Icons.lock_outline,
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          hintText: "Password",
                          maxLines: 1),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 45,
                        width: 120,
                        child: CustomButton(
                          child: isLoading
                              ? const Center(
                                  child: SpinKitFadingCircle(
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                )
                              : const Text("Login"),
                          onpress: () async {
                            log("working");

                            if (_loginFormKey.currentState!.validate()) {
                              log("validated");
                              setState(() {
                                isLoading = true;
                              });

                              loginUser();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -40,
            right: 80,
            child: Transform.rotate(
              angle: -100,
              child: Container(
                height: 100,
                width: 40,
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 95, 88, 88).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Positioned(
            top: -40,
            right: 40,
            child: Transform.rotate(
              angle: -100,
              child: Container(
                height: 150,
                width: 40,
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 95, 88, 88).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Positioned(
            top: -5,
            right: -10,
            child: Transform.rotate(
              angle: -100,
              child: Container(
                height: 100,
                width: 40,
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 95, 88, 88).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
