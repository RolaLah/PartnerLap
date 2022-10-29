// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_lap/screens.dart/Log.dart';
import 'package:our_lap/screens.dart/info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Home();
  }
}

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;

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
    print(user?.email);
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 12,
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return Login_screen();
                  }),
                ),
              );
            },
            icon: Icon(Icons.logout)),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return Info();
                    }),
                  ),
                );
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
