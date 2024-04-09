import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/firebase/firebase_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NewRegistrationPage extends StatelessWidget {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordConfirmController =
      new TextEditingController();

  NewRegistrationPage({super.key});

  bool validate_inputs() {
    bool validEmail = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(_emailController.text);
    return (!(_emailController.text == "" && _passwordController.text == "") && validEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New User",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: Get.width,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: ConfigClass.textLightGrey.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: Get.width,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: ConfigClass.textLightGrey.withOpacity(0.5)),
                  ),
                  obscureText: true,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: Get.width,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: _passwordConfirmController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                        color: ConfigClass.textLightGrey.withOpacity(0.5)),
                  ),
                  obscureText: true,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: Get.width,
              height: 55,
              decoration: BoxDecoration(
                  color: ConfigClass.greyColor,
                  borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                onPressed: () {
                  if (validate_inputs() &&
                      _passwordController.text ==
                          _passwordConfirmController.text) {
                    FirebaseFunctions()
                        .new_user(_emailController.text,
                            _passwordConfirmController.text)
                        .whenComplete(
                      () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("New user successfully created"),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      "You can login now. Navigating to the login screen"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () => Get.offAllNamed('/login'),
                                          child: Text("Ok"))
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (!validate_inputs()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Invalid input"),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "Please make sure all fields are filled out correctly."),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text("Ok"))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (_passwordController.text !=
                      _passwordConfirmController.text) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Passwords do not match!"),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "Confirmed password does not match. Please check your inputs and try again"),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text("Ok"))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                // onPressed: () => Get.toNamed('/all'),
                child: Text(
                  "Proceed",
                  style: TextStyle(color: ConfigClass.textWhite),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a user?",
                    style: TextStyle(
                      color: ConfigClass.textLightGrey,
                    )),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                      color: ConfigClass.greyColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
