import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final labelText;
  final obscureText;

  const TextInput({Key key, this.labelText, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      obscureText: this.obscureText,
      decoration: InputDecoration(
          labelText: this.labelText,
          filled: true,
          fillColor: Colors.blue[400],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
