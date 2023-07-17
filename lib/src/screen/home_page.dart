import 'package:exam6_soliyev_qobilbek/src/screen/home.dart';
import 'package:exam6_soliyev_qobilbek/src/screen/register_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
   String? emailValidationText;
   String? passwordValidation;
   HomeScreen({
    this.emailValidationText,
    this.passwordValidation,
    super.key}) ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? facePassword = HomeScreen().passwordValidation;
  String? faceEmail = HomeScreen().emailValidationText;
  String? emailValidationText;
  String? passwordValidation;
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
            builder: (context) => const Home(),
          ),
        )
      : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(image: AssetImage("assets/images/img.png")),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 21, right: 21),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "L",
                        style: TextStyle(
                          color: Color(0xFF252B5C),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "et’s ",
                        style: TextStyle(
                          color: Color(0xFF252B5C),
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFF1F4C6B),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "quis nostrud exercitation ullamco laboris nisi ut",
                      style: TextStyle(
                        color: Color(0xFF53587A),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // SizedBox(
                //   height: 60,
                //   width: 320,
                //   child: DecoratedBox(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Color(0xFF234F68),
                //     ),
                //     child: Center(
                //       child: Text("your password is incorrect"),
                //     ),
                //   ),
                // ),
                TextField(
                  onSubmitted: validateEmail,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.pages),
                      labelText: "Email",
                      // errorText: faceEmail,
                      hintText: "exam@modul6.com",
                      filled: true,
                      fillColor: Color(0xFFF5F4F8),
                      border: InputBorder.none),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  onSubmitted: validatePassword,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      labelText: "Password",
                      hintText: "Modul6exam",
                      // errorText: facePassword,
                      helperText: "Forgot password?",
                      filled: true,
                      fillColor: Color(0xFFF5F4F8),
                      border: InputBorder.none),
                ),
                const SizedBox(height: 40),
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
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 170,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          color: Color(0xFFA1A5C1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 188,
                      height: 80,
                      child: FilledButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF5F4F8),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Center(
                          child: Image(
                            image: AssetImage("assets/images/layout.png"),
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 188,
                      height: 80,
                      child: FilledButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFF5F4F8),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Center(
                          child: Image(
                            image: AssetImage("assets/images/layout1.png"),
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        color: Color(0xFF53587A),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Color(0xFF1F4C6B),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
