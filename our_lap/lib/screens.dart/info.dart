import 'package:flutter/material.dart';
import 'package:our_lap/home.dart';

class Info extends StatelessWidget {
  const Info({super.key});

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
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(user!.uid.toString(), style: _defTextStyle),
            Text(user!.email.toString(), style: _defTextStyle),
            Text("Role", style: _defTextStyle),
          ],
        ),
      ),
    );
  }
}

var _defTextStyle = TextStyle(fontSize: 22);
