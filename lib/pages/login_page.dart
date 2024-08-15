import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:waste_map/partials/custom_button.dart';
import 'package:waste_map/partials/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  GlobalKey _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Waste\nMap",
                  style: GoogleFonts.handjet(fontSize: 56, height: 0.8, letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  "LOGIN",
                  style: GoogleFonts.inder(fontSize: 28, height: 0.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                CustomInput(label: "E-Mail", icon: Icons.email_outlined, controller: email),
                const SizedBox(height: 15),
                CustomInput(
                  label: "Senha",
                  icon: CupertinoIcons.padlock,
                  controller: pass,
                  isPassword: true,
                  formatter: MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')}),
                ),
                const SizedBox(height: 15),
                CustomButton(
                  child: Text("LOGIN", style: GoogleFonts.inder(fontSize: 16, height: 0.5, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/app");
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  child: Text(
                    "Ainda não tem conta? Faça crie uma aqui",
                    style: GoogleFonts.inder(fontSize: 12, height: 0.5, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/signup");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
