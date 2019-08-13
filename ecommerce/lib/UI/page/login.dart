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
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  final formKey = GlobalKey<FormState>();
  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_pass = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
          Container(
            alignment: Alignment.center,
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: txt_email,
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
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.lock),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: txt_email,
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
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue,
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            'Login',
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
                      Text("Don't have an account? Click here to",),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FlatButton(
                            child: Text(
                              'Sign Up!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.red, fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
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
            ),
          ),
        ],
      ),
    );
  }
}
