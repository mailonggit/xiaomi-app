import 'package:ecommerce/UI/page/homepage.dart';
import 'package:ecommerce/UI/page/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController txt_email = TextEditingController();

  TextEditingController txt_pass = TextEditingController();

  TextEditingController txt_confirmpass = TextEditingController();

  TextEditingController txt_name = TextEditingController();

  String gender, groupValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        children: <Widget>[
          inputInformation("Name", Icon(Icons.person), TextInputType.text, txt_name, false),

          radioButton(),

          inputInformation("Email", Icon(Icons.email),TextInputType.emailAddress, txt_email, false),

          inputInformation("Password", Icon(Icons.lock), TextInputType.text, txt_pass, true),

          inputInformation("Confirm Password", Icon(Icons.lock),TextInputType.text, txt_confirmpass, true),
          

          customButton("Sign Up", Colors.blue),

          hintForLogin(),

          //Divider( color: Colors.black,),

          //Center(child: Text("Other Login Option")),

          //customButton("Sign in with Google", Colors.red),
        ],
      ),
    );
  }

  checkPassword(value, {TextEditingController password}) {
    if (value.isEmpty) {
      return "The password cannot be empty";
    } else if (value.length < 6) {
      return "The password must be at least 6 characters long";
    } else if (password.text != value) {
      return "The password do not match";
    }
    return null;
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
                checkPassword(value);
              } else if (lbl_text == 'Confirm Password') {
                checkPassword(value, password: txt);
              }
            },
          ),
        ),
      ),
    );
  }

  radioButton() {
    return Row(
      children: <Widget>[
        itemButton('Male'),
        itemButton('Female'),
      ],
    );
  }

  itemButton(value) {
    return Expanded(
      child: ListTile(
        title: Text(
          value,
          textAlign: TextAlign.center,
        ),
        trailing: Radio(
          value: value,
          groupValue: groupValue,
          onChanged: (value) {
            valueChanged(value);
          },
        ),
      ),
    );
  }

  hintForLogin() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            "Already have an account? Click here to",
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FlatButton(
            child: Text(
              'Login!',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
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
            onPressed: () {
              //Navigator.push(context,
              // MaterialPageRoute(builder: (context) => Login()));
            },
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

  void valueChanged(value) {
    setState(() {
      if (value == 'Male') {
        groupValue = value;
      } else if (value == 'Female') {
        groupValue = value;
      }
    });
  }
}
