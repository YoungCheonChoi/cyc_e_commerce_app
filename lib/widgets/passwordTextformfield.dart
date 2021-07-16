import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {

  final bool obserText;
  final Function validator;
  final String name;
  final Function onTap;

  PasswordTextFormField({required this.name,required this.validator, required this.onTap, required this.obserText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      validator: validator(),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
