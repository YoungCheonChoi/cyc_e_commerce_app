import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function onPressed;
  final String name;

  MyButton({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
        child: Text(name),
        color: Colors.pinkAccent,
        onPressed: onPressed(), //이게맞나
      ),
    );
  }
}
