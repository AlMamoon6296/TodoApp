import 'package:flutter/material.dart';
import 'package:login/log.dart';
import 'package:login/utils/colors.dart';
import 'package:login/widgets/custom_text.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetoscreen();
  }

  _navigatetoscreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => logScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
            child: CustomText(
                shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                fontSize: 60,
                text: 'W E L C O M E')

            //Text(
            //   "Welcome",
            //   style: TextStyle(
            //       color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            ),
      ),
    );
  }
}
