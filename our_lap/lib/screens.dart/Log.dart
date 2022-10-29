import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_lap/home.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("images/1.jpg"))),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Hi..",
                  style: TextStyle(fontSize: 30, fontFamily: "AbyssinicaSIL"),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              controller: Email,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(
                  "Email :",
                  style: TextStyle(
                    fontFamily: "AbyssinicaSIL",
                    fontSize: 25,
                  ),
                ),
                prefixIcon: Icon(Icons.email),
                hintText: " enter your email",
                prefixIconColor: Color.fromARGB(255, 164, 6, 179),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 30, color: Color.fromARGB(255, 164, 6, 179)),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gapPadding: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: Password,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  " Password :",
                  style: TextStyle(
                    fontFamily: "AbyssinicaSIL",
                    fontSize: 25,
                  ),
                ),
                prefixIcon: Icon(Icons.email),
                hintText: "enter your password",
                prefixIconColor: Color.fromARGB(255, 164, 6, 179),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 30, color: Color.fromARGB(255, 164, 6, 179)),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gapPadding: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () async {
                  try {
                    var authenticationoject = FirebaseAuth.instance;
                    UserCredential MyUser =
                        await authenticationoject.signInWithEmailAndPassword(
                            email: Email.text, password: Password.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Done successfull")));
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return Home();
                    })));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Sorry, please try again")));
                  }
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontFamily: "AbyssinicaSIL",
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 150)),
                Text(
                  "Not a member?",
                  style: TextStyle(fontSize: 20, fontFamily: "AbyssinicaSIL"),
                ),
                TextButton(
                    onPressed: () async {
                      try {
                        var authenticationoject = FirebaseAuth.instance;
                        UserCredential MyUser = await authenticationoject
                            .createUserWithEmailAndPassword(
                                email: Email.text, password: Password.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Done successfull")));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Sorry, there already exists an account registered with this email address")));
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 20, fontFamily: "AbyssinicaSIL"),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
