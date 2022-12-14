// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_lap/screens.dart/Log.dart';
import 'package:our_lap/screens.dart/info.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static String UserRole = "userR";

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
    return FutureBuilder(
      builder: (context, snapshot) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .get()
            .then(
          (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            // ...
            Home.UserRole = data.entries
                .singleWhere((element) => element.key == 'role')
                .value
                .toString();
            print("_UserRole = ${Home.UserRole}");
          },
          onError: (e) => print("Error getting document: $e"),
        );
        return _Scaffold(context);
      },
    );
  }

  Scaffold _Scaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: ConColor,
      appBar: AppBar(
        elevation: 12,
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: ((context) {
                  return Login_screen();
                })),
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
              title: Text("Admin", style: radioTextStyle),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) {
                    return Info();
                  })),
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
