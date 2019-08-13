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
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  final formKey = GlobalKey<FormState>();
  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_pass = TextEditingController();
  TextEditingController txt_confirmpass = TextEditingController();
  TextEditingController txt_name = TextEditingController();
  String gender;
  bool loading = false, isLogedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();

    isLogedIn = await googleSignIn.isSignedIn();

    if (isLogedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    //after login => stop loading
    setState(() {
      loading = false;
    });
  }

  Future signInWithGoogle() async {
    preferences = await SharedPreferences.getInstance(); //previous data

    setState(() {
      loading = true;
    });

    //sign in part
    GoogleSignInAccount account = await googleSignIn.signIn();

    GoogleSignInAuthentication authentication = await account.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken);

    FirebaseUser firebaseUser =
        await firebaseAuth.signInWithCredential(credential);

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();

      final List<DocumentSnapshot> documents = result.documents;
      //list empty
      if (documents.length == 0) {
        //insert user to collection
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoUrl,
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.displayName);
      } else {
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("username", documents[0]["username"]);
        await preferences.setString("photoUrl", documents[0]["phoyoUrl"]);
      }

      Fluttertoast.showToast(msg: "Login was successful");
      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Fluttertoast.showToast(msg: "Login Failed! Please login again");
    }
  }

  inputInformation(
      lbl_text, Icon icon_text, TextInputType type, TextEditingController txt) {
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
            controller: txt,
            validator: (value) {
              if (value.isEmpty) {
                return "The password cannot be empty";
              } else if (value.length < 6) {
                return "The password must be at least 6 characters long";
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        children: <Widget>[
          Visibility(
            visible: loading ?? true,
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          ),
          inputInformation(
              "Name", Icon(Icons.person), TextInputType.text, txt_name),



          inputInformation("Email", Icon(Icons.email),
              TextInputType.emailAddress, txt_email),

          inputInformation(
              "Password", Icon(Icons.lock), TextInputType.text, txt_pass),

          inputInformation("Confirm Password", Icon(Icons.lock),
              TextInputType.text, txt_confirmpass),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: FlatButton(
              child: Text('Forgot Password'),
              onPressed: () {},
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "Already have an account? Click here to",
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FlatButton(
                  child: Text(
                    'Login!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Center(child: Text("Other Login Option")),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.red,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
