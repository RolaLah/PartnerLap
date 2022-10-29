import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_lap/firebase_options.dart';
import 'package:our_lap/screens.dart/Log.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Login_screen();
  }
}
