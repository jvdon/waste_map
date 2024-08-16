import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;
  final double width;
  final bool highlighted;
  const IconTextButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      this.highlighted = false,
      this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width / 5,
      decoration: BoxDecoration(
        border: Border.all(color: (highlighted) ? Colors.red : Colors.blue),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(
        child: IconButton(
          onPressed: onTap,
          color: Colors.blue,
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Icon(icon, color: Colors.blue),
              SizedBox(width: 10),
              Text(text,
                  style: GoogleFonts.inder(
                      color: Colors.white, fontSize: 20, height: 1)),
            ],
          ),
        ),
      ),
    );
  }
}
