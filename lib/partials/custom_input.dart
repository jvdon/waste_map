import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatelessWidget {
  final double width;
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final bool strengthTest;
  final TextInputFormatter? formatter;

  const CustomInput({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.formatter,
    this.isPassword = false,
    this.strengthTest = false,
    this.width = 350,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
            label: Text(label),
            labelStyle: GoogleFonts.inder(fontSize: 20, height: 0.5, color: Colors.white),
            prefixIcon: Icon(icon, color: Colors.white),
            fillColor: Colors.lightBlue[400],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never),
        controller: controller,
        obscureText: isPassword,
        cursorColor: Colors.white,
        inputFormatters: (formatter != null) ? [formatter!] : null,
        style: GoogleFonts.inder(fontSize: 16, color: Colors.white),
        validator: (value) {
          if (!(value != null && value.isNotEmpty)) {
            return "Campo Obrigatorio";
          } else if (strengthTest &&
              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
            return "Senha fraca";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
