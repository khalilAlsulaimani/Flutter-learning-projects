import 'package:flutter/material.dart';

class signUpPage extends StatelessWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 3,
          leading: const Icon(Icons.account_circle),
          title: const Text('Sign Up'),
          actions: const [Icon(Icons.arrow_circle_right_outlined)]),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              Container(
                child: const TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_month_outlined),
                      labelText: 'Age',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.grey)),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
