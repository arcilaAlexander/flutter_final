import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void Initializing() async {
  await Firebase.initializeApp();
}

void stateFirebase({@required context}) {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      Navigator.pushNamed(context, '/login');
    } else {
      Navigator.pushNamed(context, '/news');
    }
  });
}

void signIn({@required email, @required password, @required context}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showMaterialDialog(context: null, message: 'Usuario no encontrados');
    } else if (e.code == 'wrong-password') {
      showMaterialDialog(context: null, message: 'Password erroneo');
    }
  } catch (e) {
    print(e);
  }
}

void register({@required email, @required password, @required context}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showMaterialDialog(
          context: null, message: 'The password provided is too weak.');
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showMaterialDialog(
          context: null, message: 'The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

void signOut(context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushNamed(context, '/login');
}

showMaterialDialog({@required context, @required String message}) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: Text("Warning!"),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Close me!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
}
