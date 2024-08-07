import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simple_crud/pages/home.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBgIZHD9CluAyfIWe3ojkA1S4Bzgnu86s0",
      appId: "1:1009582457727:android:c65c66fd3cc8418f02d04a",
      messagingSenderId: "1009582457727",
      projectId: "crudapp-f9f39",
    ),
  ):

  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

