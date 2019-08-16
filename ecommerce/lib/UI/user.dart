import 'package:firebase_database/firebase_database.dart';
class User{
  FirebaseDatabase database = FirebaseDatabase.instance;

  String user = "Users";

  createUser(Map value){
    database.reference().child(user).push().set(value).catchError((error) => print(error.toString()));
  }
}