import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:login/screen1.dart';
import 'package:login/utils/colors.dart';
import 'package:login/widgets/coustom_button.dart';
import 'package:login/widgets/custom_text.dart';
import 'package:login/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logScreen extends StatefulWidget {
  const logScreen({super.key});

  @override
  State<logScreen> createState() => _logScreenState();
}

class _logScreenState extends State<logScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      _navigateToHome();
    }
  }

  _login() async {
    if (_usernameController.text == 'example@gmail.com' &&
        _passwordController.text == '12345') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      _navigateToHome();
    } else {
      Flushbar(
              message: "Invalid Userid and password",
              duration: Duration(seconds: 2))
          .show(context);
    }
  }

  _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          centerTitle: true,
          title: CustomText(shadows: [
            Shadow(
              blurRadius: 100,
              color: Colors.blue,
            ),
          ], fontSize: 25, text: 'L  O  G  I  N')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                  controller: _usernameController, Lable: "Email"),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                  controller: _passwordController, Lable: "Password"),
            ),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: CoustomButton(onTap: _login, text: "Login"),
            )
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //       controller: _usernameController,
            //       decoration: InputDecoration(
            //           label: Text("Email"),
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(12)))),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     controller: _passwordController,
            //     decoration: InputDecoration(
            //         label: Text("Password"),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(16))),
            //   ),
            // ),
            // ElevatedButton(onPressed: _login, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
