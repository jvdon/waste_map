import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Waste\nMap",
              style: GoogleFonts.handjet(
                fontSize: 64,
                height: 0,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text("Conectando o mundo para um futuro sem lixo"),
            const SizedBox(height: 5),
            Container(
              width: 250,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: IconButton(
                icon: Text(
                  "Login",
                  style: GoogleFonts.inder(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: TextButton(
                child: Text(
                  "Não tem conta? Cadastre-se",
                  style: GoogleFonts.inder(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
