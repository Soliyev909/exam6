import 'package:exam6_soliyev_qobilbek/src/screen/home.dart';
import 'package:exam6_soliyev_qobilbek/src/screen/register_page.dart';
import 'package:flutter/material.dart';

class EnterCode extends StatelessWidget {
  const EnterCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String count = '';
    bool check = true;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Enter the ",
                  style: TextStyle(
                    color: Color(0xFF252B5C),
                    fontSize: 25,
                  ),
                ),
                Text(
                  "code   ",
                  style: TextStyle(
                    color: Color(0xFF234F68),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
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
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "exam@modul6.com",
                  style: TextStyle(
                    color: Color(0xFF252B5C),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: TextField(
                      onSubmitted: (value) {
                        count += value;
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF5F4F8),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: TextField(
                      onSubmitted: (value) {
                        count += value;
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF5F4F8),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: TextField(
                      onSubmitted: (value) {
                        count += value;
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF5F4F8),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: TextField(
                      onSubmitted: (value) {
                        count += value;
                        if (count == "0000") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        } else {

                          check = false;
                        }
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF5F4F8),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            if (!check)
              SizedBox(
                height: 80,
                width: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Invalid password",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
