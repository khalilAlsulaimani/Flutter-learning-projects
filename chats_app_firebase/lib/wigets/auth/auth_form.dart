import 'dart:io';

import 'package:flutter/material.dart';

import '../pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, String username,
      bool isLogin, File image, BuildContext ctx) submitFn;

  final bool _isLoading;

  AuthForm(this.submitFn, this._isLoading);

  @override
  State<StatefulWidget> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _email = "";
  String _password = "";
  String _username = "";
  File? _userImageFile;

  void _pickedImage(File pickedImage) {
    _userImageFile = pickedImage;
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();

    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Upload Image')));
      return;
    }
    if (isValid != null && isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_email.trim(), _password.trim(), _username.trim(),
          _isLogin, _userImageFile!, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_isLogin) UserImagePicker(imagePickFn: _pickedImage),
                TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.none,
                  key: const ValueKey('email'),
                  validator: (val) {
                    if (val != null) {
                      if (val.isEmpty || !val.contains('@')) {
                        return 'please enter valid email';
                      }
                      return null;
                    }
                  },
                  onSaved: (val) => _email = val!,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email Address'),
                ),
                if (!_isLogin)
                  TextFormField(
                    autocorrect: true,
                    enableSuggestions: true,
                    textCapitalization: TextCapitalization.words,
                    key: const ValueKey('username'),
                    validator: (val) {
                      if (val != null) {
                        if (val.isEmpty || val.length < 4) {
                          return 'Please enter at least 4 characters username';
                        }
                      }

                      return null;
                    },
                    onSaved: (val) => _username = val!,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                TextFormField(
                  key: const ValueKey('password'),
                  validator: (val) {
                    if (val != null) {
                      if (val.isEmpty || val.length < 7) {
                        return 'Please enter at least 7 characters password';
                      }
                    }

                    return null;
                  },
                  onSaved: (val) => _password = val!,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                if (widget._isLoading) const CircularProgressIndicator(),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_isLogin ? 'Login' : 'Sign Up'),
                ),
                TextButton(
                  child: Text(
                    _isLogin
                        ? 'Create new Account'
                        : 'I already have an account',
                    style: const TextStyle(color: Colors.pink),
                  ),
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
