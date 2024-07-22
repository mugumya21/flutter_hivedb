import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String textname;
  VoidCallback onPressed;
  MyButton({super.key, required this.onPressed, required this.textname});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 20,
      child: MaterialButton(
        child: Text(textname),
        color: Colors.yellow,
        onPressed: onPressed,
      ),
    );
  }
}
