import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_bloc/screens/splash_screen.dart';

FlutterSecureStorage? secureStorage;

void main() async {
  secureStorage = FlutterSecureStorage();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: InitialSplashScreen(),
    );
  }
}
