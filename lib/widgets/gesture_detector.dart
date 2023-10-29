import 'package:flutter/material.dart';

class ClickDetect extends StatelessWidget {
  const ClickDetect({super.key, required this.icon, required this.onPressed});
  final Icon icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(icon.icon, color: Colors.white, size: 30),
      ),
    );
  }
}
