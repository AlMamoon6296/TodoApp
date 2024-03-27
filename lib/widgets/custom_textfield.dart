import 'package:flutter/material.dart';
import 'package:login/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String Lable;
  const CustomTextField(
      {Key? key, required this.controller, required this.Lable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 6,
          spreadRadius: 2,
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
            fillColor: bgColor,
            filled: true,
            label: Text(
              Lable,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
