import 'package:flutter/material.dart';

class CoustomButton extends StatelessWidget {
  final VoidCallback onTap;

  final String text;
  const CoustomButton({Key? key, required this.onTap, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of (context).size.width;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 6,
            spreadRadius: 3,
          )
        ],
      ),
      child: ElevatedButton(
          onPressed: onTap ,
          child: Text(text, style: const TextStyle(fontSize: 20),),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
              width,
               50)
        ),
      ),
    );
  }
}
