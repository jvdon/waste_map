import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final double width;
  const CustomButton({super.key, required this.child, required this.onTap, this.width = 250});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width/5,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: TextButton(
        child: child,
        onPressed: onTap,
      ),
    );
  }
}
