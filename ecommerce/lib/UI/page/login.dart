import 'package:ecommerce/UI/page/homepage.dart';
import 'package:ecommerce/UI/page/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  inputInformation("Email", Icon(Icons.email), TextInputType.emailAddress, txt_email, false),

                  inputInformation("Password", Icon(Icons.lock),TextInputType.text, txt_pass, true),

                  customButton("Login", Colors.blue),

                  Center(
                    child: FlatButton(
                      child: Text('Forgot Password'),
                      onPressed: () {},
                    ),
                  ),

                  hintForSignUp(),

                  //Divider( color: Colors.black,),

                  //Center(child: Text("Other Login Option")),

                  //customButton("Sign in with Google", Colors.red),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  inputInformation(lbl_text, icon_text, type, txt, hideText) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white.withOpacity(0.5),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: lbl_text,
              icon: icon_text,
            ),
            keyboardType: type,
            obscureText: hideText,
            controller: txt,
            validator: (value) {
              if (lbl_text == 'Password') {
                //checkPassword(value);
              } else if (lbl_text == 'Confirm Password') {
                //checkPassword(value, password: txt);
              }
            },
          ),
        ),
      ),
    );
  }

  hintForSignUp() {
    return Center(
      child: FlatButton(
        child: Text(
          'SignUp!',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignUp()));
        },
      ),
    );
  }

  customButton(title, Color backgroundColor) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          color: backgroundColor,
          child: MaterialButton(
            onPressed: () {},
            minWidth: MediaQuery.of(context).size.width,
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
