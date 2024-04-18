import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/configs/routes.dart';
import 'package:expensio_v2/pages/LoadingScreen.dart';
import 'package:expensio_v2/pages/home_page/MyHomePage.dart';
import 'package:expensio_v2/pages/login_page/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions( //taken from google-services.json
    apiKey: 'AIzaSyAOTqz2ZnUa6WX5qh-j0iiUv6bIycHQmMM',
    appId: '1:1083002905535:android:fae76dc9620cbe88f0f70a',
    messagingSenderId: '1083002905535',
    projectId: 'expensio-v2',
    storageBucket: 'expensio-v2.appspot.com',
  )
  );
  runApp(
    MyApp()
  );
}

class MyApp extends StatefulWidget { 
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  bool? loginStatus;
  Widget nextScreen = LoadingScreen();

  Future<void> checkLoginStatus() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var status = _prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      loginStatus = status;
    });
    print("Current login status set to ${loginStatus}");
  }

  void initState() {
    checkLoginStatus().whenComplete(() {
      setState(() {
        if (loginStatus == true) {
          Get.rawSnackbar(
          message: 'Welcome back!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ConfigClass.incomeGreen,
          // colorText: Colors.white,
          borderRadius: 0,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          snackStyle: SnackStyle.GROUNDED,
          maxWidth: Get.width,
          forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
          reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
        );
          nextScreen = MyHomePage();
        } else {
          nextScreen = LoginPage();
        }
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: GetPages, home: nextScreen);
      // getPages: GetPages, home: MyHomePage());
  }
}
