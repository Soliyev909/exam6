import 'package:exam6_soliyev_qobilbek/src/screen/enter_code.dart';
import 'package:exam6_soliyev_qobilbek/src/screen/home_page.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String? faceEmail;
  String? facePassword;
  String email = "";
  String password = "";

  bool get openHome => email.isNotEmpty && password.isNotEmpty;


  void validateEmail(String value) {
    if (!RegExp(r"^[a-zA-Z][a-zA-Z\d]*@[a-zA-Z\d]+\.[a-zA-Z]{2,6}$")
        .hasMatch(value)) {
      setState(() {
        faceEmail = "Invalid email address!";
      });
      return;
    }

    setState(() {
      faceEmail = null;
      email = value;
    });
  }

  void validatePassword(String value) {
    if (!RegExp(r".{8,}").hasMatch(value)) {
      setState(() {
        facePassword =
        "Password is too short, it must be at least 8 characters";
      });
      return;
    }

    if (value.contains(" ")) {
      setState(() {
        facePassword = "Password shouldn't have space";
      });
      return;
    }

    if (!RegExp(r"\d").hasMatch(value)) {
      setState(() {
        facePassword = "Password must have at least one number";
      });
      return;
    }

    if (!RegExp(r"[a-z]").hasMatch(value)) {
      setState(() {
        facePassword = "Password must have at least one letter";
      });
      return;
    }

    if (!RegExp(r"[A-Z]").hasMatch(value)) {
      setState(() {
        facePassword =
        "Password must have at least one Capital letter";
      });
      return;
    }

    setState(() {
      facePassword = null;
      password = value;
    });
  }
  void openHomePage() => openHome
      ? Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const EnterCode(),
    ),
  )
      : null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Create your ",
                  style: TextStyle(
                    color: Color(0xFF252B5C),
                    fontSize: 25,
                  ),
                ),
                Text(
                  "account ",
                  style: TextStyle(
                    color: Color(0xFF234F68),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "quis nostrud exercitation ullamco laboris nisi ut",
                  style: TextStyle(
                    color: Color(0xFF53587A),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  labelText: "Full name",
                  filled: true,
                  fillColor: Color(0xFFF5F4F8),
                  border: InputBorder.none),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onSubmitted: validateEmail,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.pages),
                  labelText: "Email",
                  hintText: "exam@modul6.com",
                  filled: true,
                  fillColor: Color(0xFFF5F4F8),
                  border: InputBorder.none),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onSubmitted: validatePassword,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  labelText: "Password",
                  hintText: "Modul6exam",
                  helperText: "Forgot password?",
                  filled: true,
                  fillColor: Color(0xFFF5F4F8),
                  border: InputBorder.none),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 65,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8BC83F),
                    ),
                    onPressed: openHomePage,
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
