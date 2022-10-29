import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return _Home();
  }
}

class _Home extends StatefulWidget {
  const _Home({super.key});

  @override
  State<_Home> createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: const Icon(Icons.home_filled),
        title: const Text("Home Screen"),
      ),
      body: SafeArea(
        //   child: Positioned(
        // bottom: 1,
        // left: 1,
        child: Text("A"),
      ),
      // ),
    );
  }
}
