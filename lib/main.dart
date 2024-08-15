import 'package:flutter/material.dart';
import 'package:waste_map/pages/loading_page.dart';
import 'package:waste_map/pages/login_page.dart';
import 'package:waste_map/pages/main_page.dart';
import 'package:waste_map/pages/signup_page.dart';
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
  bool firstLogin = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => const LoadingPage(target: LoginPage(), delay: Duration(seconds: 2)),
        "/signup": (context) => const LoadingPage(target: SignupPage(), delay: Duration(seconds: 2)),
        "/app": (context) => const MainPage(),
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: (firstLogin)
              ? const LoadingPage(target: WelcomePage(), delay: Duration(seconds: 3))
              : const LoadingPage(target: MainPage(), delay: Duration(seconds: 3)),
        ),
      ),
    );
  }
}
