import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:information_technology_bps/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:information_technology_bps/dekstop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDHOSG4ZeyYKZa6iGUfSqX4GhUzn6bUf7U",
          projectId: "latihanfirebase-d2a4d",
          messagingSenderId: "136495222639",
          appId: "1:136495222639:web:9dd1540ae5d1f7d393a29a"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.white),
          ),
          canvasColor: secondaryColor),
      home: Scaffold(body: Dekstop()),
    );
  }
}
