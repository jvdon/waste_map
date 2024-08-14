import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waste_map/pages/loading_page.dart';
import 'package:waste_map/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool firstLogin = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child:
              (firstLogin) ? LoadingPage(target: WelcomePage()) : Placeholder(),
        ),
      ),
    );
  }
}
