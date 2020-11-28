import 'package:ChefZone/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String pass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //var authc = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Login.jpg"), fit: BoxFit.cover))),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ChefZone",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 50),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          hintText: "Enter user name",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          )),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (var value) {
                        pass = value;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Enter password",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          )),
                    ),
                  ],
                )),
            SizedBox(height: 100),
            FloatingActionButton.extended(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                label: Text(
                  'login',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: signIn),
            GestureDetector(
                onTap: () {
                  print("Container clicked");
                },
                child: new Container(
                  child: Text(
                    "To create new account click here",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        )
      ]),
    );
  }

  void signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
