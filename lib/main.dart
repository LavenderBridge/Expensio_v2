import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/configs/routes.dart';
import 'package:expensio_v2/controllers/Firestore_controller.dart';
import 'package:expensio_v2/pages/LoadingScreen.dart';
import 'package:expensio_v2/pages/home_page/MyHomePage.dart';
import 'package:expensio_v2/pages/login_page/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      //taken from google-services.json
      apiKey: 'AIzaSyAOTqz2ZnUa6WX5qh-j0iiUv6bIycHQmMM',
      appId: '1:1083002905535:android:fae76dc9620cbe88f0f70a',
      messagingSenderId: '1083002905535',
      projectId: 'expensio-v2',
      storageBucket: 'expensio-v2.appspot.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? loginStatus;
  String? _collectionData;
  Widget nextScreen = const LoadingScreen();
  FirestoreController storageController = Get.put(FirestoreController());

  
  Future<void> checkLoginStatus() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var status = _prefs.getBool('isLoggedIn') ?? false;
    var uid = _prefs.getString('uid') ?? "";
    setState(() {
      loginStatus = status;
      _collectionData = uid;
    });
    // print("Current login status set to ${loginStatus}");
  }
  
  @override
  void initState() {
    checkLoginStatus().whenComplete(() {
      if (loginStatus == true) {
        storageController.Uid.value = _collectionData!;
        storageController.initInstance();
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
        setState(() {
          nextScreen = const MyHomePage();
        });
      } else {
        setState(() {
          nextScreen = LoginPage();
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        getPages: GetPages,
        home: nextScreen);
    // getPages: GetPages, home: MyHomePage());
  }
}
