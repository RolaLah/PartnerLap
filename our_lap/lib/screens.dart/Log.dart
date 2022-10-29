import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_lap/home.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();

class _Login_screenState extends State<Login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          sizedBox_Def,
          email_TextField,
          sizedBox_Def,
          pass_TextField,
          sizedBox_Def,
          SignIn(),
          sizedBox_Def,
          notAMember_Text,
          SignUp(),
          chip_Red,
          chip_Blue,
          chip_MixColors
        ],
      ),
    );
  }
}

var sizedBox_Def = SizedBox(
  height: 40,
);
var email_TextField = TextField(
  controller: emailController,
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
        borderSide:
            BorderSide(width: 30, color: Color.fromARGB(255, 164, 6, 179)),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gapPadding: 20),
  ),
);
var pass_TextField = TextField(
  controller: passController,
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
    prefixIcon: Icon(Icons.password),
    hintText: "enter your password",
    prefixIconColor: Color.fromARGB(255, 164, 6, 179),
    border: OutlineInputBorder(
        borderSide:
            BorderSide(width: 30, color: Color.fromARGB(255, 164, 6, 179)),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gapPadding: 20),
  ),
);
var notAMember_Text = Text(
  "Not a member?",
  style: TextStyle(fontSize: 20, fontFamily: "AbyssinicaSIL"),
  textAlign: TextAlign.center,
);
var chip_Red = InkWell(
  child: Chip(
    label: Text("Red"),
  ),
  onTap: () {
    emailController.text = "red@red.com";
    passController.text = "12341234";
  },
);
var chip_Blue = InkWell(
  child: Chip(
    label: Text("Blue"),
  ),
  onTap: () {
    emailController.text = "blue@blue.com";
    passController.text = "12341234";
  },
);
var chip_MixColors = InkWell(
  child: Chip(
    label: Text("MixColors"),
  ),
  onTap: () {
    emailController.text = "mix@colors.com";
    passController.text = "12341234";
  },
);

class SignIn extends StatelessWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          try {
            var authenticationoject = FirebaseAuth.instance;
            UserCredential MyUser =
                await authenticationoject.signInWithEmailAndPassword(
                    email: emailController.text, password: passController.text);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Done successfull")));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) {
                  return Home();
                }),
              ),
            );
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
        ));
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        try {
          var authenticationoject = FirebaseAuth.instance;
          UserCredential MyUser =
              await authenticationoject.createUserWithEmailAndPassword(
                  email: emailController.text, password: passController.text);

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Done successfull")));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Sorry, there already exists an account registered with this email address"),
            ),
          );
        }
      },
      child: Text(
        "Sign Up",
        style: TextStyle(fontSize: 20, fontFamily: "AbyssinicaSIL"),
      ),
    );
  }
}
