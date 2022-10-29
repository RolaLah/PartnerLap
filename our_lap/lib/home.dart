// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Home();
  }
}

class _Home extends StatefulWidget {
  const _Home({super.key});

  @override
  State<_Home> createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  // String? role; // no radio button will be selected
  String role = "user"; // to set default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 12,
        leading: const Icon(Icons.home_filled),
        title: const Text("Home Screen"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22, top: 22),
              child: Text(
                "Hello, Xcolor",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white,
                  letterSpacing: 3,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 250)),
            RadioListTile(
              title: Text("User", style: radioTextStyle),
              value: "user",
              groupValue: role,
              onChanged: (value) {
                setState(() {
                  role = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("Amin", style: radioTextStyle),
              value: "admin",
              groupValue: role,
              onChanged: (value) {
                setState(() {
                  role = value.toString();
                });
              },
            ),
            TextButton.icon(
              icon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              label: Text(
                "Info",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                debugPrint("infoBtn Preesed");
              },
            )
          ],
        ),
      ),
    );
  }
}

TextStyle radioTextStyle = TextStyle(
    fontSize: 24,
    letterSpacing: 2,
    backgroundColor: Colors.white,
    fontWeight: FontWeight.w500);
