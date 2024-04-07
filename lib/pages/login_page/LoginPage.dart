import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/firebase/firebase_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
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
              height: 30,
            ),
            Container(
              width: Get.width,
              height: 55,
              decoration: BoxDecoration(
                  color: ConfigClass.greyColor,
                  borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                // onPressed: () => FirebaseFunctions().email_signin(_emailController.text, _passwordController.text),
                onPressed: () => Get.toNamed('/all'),
                child: Text(
                  "Login",
                  style: TextStyle(color: ConfigClass.textWhite),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a user?",
                    style: TextStyle(
                      color: ConfigClass.textLightGrey,
                    )),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      color: ConfigClass.greyColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Sign in with",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: Get.width,
              height: 55,
              decoration: BoxDecoration(
                  color: ConfigClass.greyColor,
                  borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Login with Google",
                  style: TextStyle(color: ConfigClass.textWhite),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: Get.width,
              height: 55,
              decoration: BoxDecoration(
                  color: ConfigClass.greyColor,
                  borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Login with Facebook",
                  style: TextStyle(color: ConfigClass.textWhite),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
