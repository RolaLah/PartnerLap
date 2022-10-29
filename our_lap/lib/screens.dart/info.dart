import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text("ID", style: _defTextStyle),
            Text("Email", style: _defTextStyle),
            Text("Role", style: _defTextStyle),
          ],
        ),
      ),
    );
  }
}

var _defTextStyle = TextStyle(fontSize: 30);
