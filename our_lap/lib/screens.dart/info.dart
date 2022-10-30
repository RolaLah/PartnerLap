import 'dart:async';

import 'package:flutter/material.dart';
import 'package:our_lap/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final coll = FirebaseFirestore.instance.collection("users");
final docRef = coll.doc(user!.uid);

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout)),
        title: const Text("User Info"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          docRef.get().then(
            (DocumentSnapshot doc) {
              final data = doc.data() as Map<String, dynamic>;
              // ...
               Home.UserRole = data.entries
                  .singleWhere((element) => element.key == 'role')
                  .value
                  .toString(); 
            },
            onError: (e) => print("Error getting document: $e"),
          );
          // if (snapshot.hasData) {
          //   final docs = snapshot.data!;
          return Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(user!.uid.toString(), style: _defTextStyle),
                Text(user!.email.toString(), style: _defTextStyle),
                // Text(docs['role'], style: _defTextStyle),
                Text(Home.UserRole, style: _defTextStyle),
              ],
            ),
          );
          // }
          // return Text("Error!");
        },
      ),
    );
  }
}

var _defTextStyle = TextStyle(fontSize: 22);
