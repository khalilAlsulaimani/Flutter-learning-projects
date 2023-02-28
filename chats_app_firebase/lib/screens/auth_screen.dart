import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../wigets/auth/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  late UserCredential _authResult;

  bool _isLoading = false;

  void _submitAuthForm(String email, String password, String username,
      bool isLogin, File image, BuildContext ctx) async {
    String errorMessage = 'Error Occurred';
    try {
      setState(() {
        _isLoading = true;
      });
      if (!isLogin) {
        _authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child('${_authResult.user!.uid}.jpg');

        await ref.putFile(image);

        final url = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(_authResult.user!.uid)
            .set({
          'username': username,
          'password': password,
          'imageURL': url,
        });
      } else {
        UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'the password is weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'the account already exists using that email';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'no user found for that email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'wrong password';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
