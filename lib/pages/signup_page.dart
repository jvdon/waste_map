import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:waste_map/partials/custom_button.dart';
import 'package:waste_map/partials/custom_input.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passConf = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
                  "CADASTRO",
                  style: GoogleFonts.inder(fontSize: 28, height: 0.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                CustomInput(label: "E-Mail", icon: Icons.email_outlined, controller: email),
                const SizedBox(height: 15),
                CustomInput(
                  label: "CPF",
                  icon: Icons.person_outline,
                  controller: cpf,
                  formatter: MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')}),
                ),
                const SizedBox(height: 15),
                CustomInput(
                    label: "Senha",
                    icon: CupertinoIcons.padlock,
                    controller: pass,
                    strengthTest: true,
                    isPassword: true),
                const SizedBox(height: 15),
                CustomInput(
                  label: "Confirme Senha",
                  icon: CupertinoIcons.padlock,
                  controller: passConf,
                  strengthTest: true,
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                CustomButton(
                  child: Text("CADASTRO", style: GoogleFonts.inder(fontSize: 16, height: 0.5, color: Colors.white)),
                  onTap: () {
                    if (_key.currentState!.validate() && pass.text == passConf.text) {
                      print("CADASTRO");
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  child: Text(
                    "Já tem conta? Faça login aqui",
                    style: GoogleFonts.inder(fontSize: 12, height: 0.5, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/login");
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
