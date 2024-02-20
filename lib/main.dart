import 'package:flutter/material.dart';
import 'package:mum/screens/googleScreen.dart';
import 'package:mum/screens/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mum/screens/signupScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      //home: const GoogleScreen(),
      home: SafeArea(
        //child: GoogleScreen(),
        child: LoginScreen(),
      ),
    );
  }
}
