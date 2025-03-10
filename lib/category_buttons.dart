import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final VoidCallback onPressed;

  const CategoryButtons(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = const Color(0xffF2F4F5),
      this.foregroundColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(backgroundColor),
            foregroundColor: WidgetStatePropertyAll(foregroundColor)),
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'Jost', fontSize: 18),
        ),
      ),
    );
  }
}
