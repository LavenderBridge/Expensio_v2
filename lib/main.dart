import 'package:expensio_v2/configs/routes.dart';
import 'package:expensio_v2/pages/login_page/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: GetPages, home: LoginPage());
  }
}
