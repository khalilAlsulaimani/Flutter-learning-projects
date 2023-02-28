import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'products.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              _textField('Title', 'Add Title', titleController),
              const SizedBox(height: 10),
              _textField('Description', 'Add Description', descController),
              const SizedBox(height: 10),
              _textField('Price', 'Add Price', priceController),
              const SizedBox(height: 10),
              const Divider(color: Colors.blueAccent),
              const SizedBox(height: 10),
              _textField(
                  'Image Url', 'Paste your image url here', priceController),
              const SizedBox(height: 10),
              const Divider(color: Colors.blueAccent),
              Consumer<Products>(
                builder: (ctx, value, _) => ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue[900]),
                    ),
                    child: const Text('Submit'),
                    onPressed: () async {
                      if (titleController.text.isEmpty ||
                          descController.text.isEmpty ||
                          priceController.text.isEmpty ||
                          imageUrlCont.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please enter all Fields',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (double.tryParse(priceController.text) ==
                          null) {
                        Fluttertoast.showToast(
                            msg: 'Please enter a valid price',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        value.add(
                          title: titleController.text,
                          description: descController.text,
                          price: double.tryParse(priceController.text)!,
                          imageUrl: imageUrlCont.text,
                        );
                        Navigator.pop(context);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(String title, String desc, controller) {
    return Platform.isIOS
        ? CupertinoTextField(
            placeholder: title,
            placeholderStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            controller: controller,
          )
        : TextField(
            decoration: InputDecoration(
              labelText: title,
              hintText: desc,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            controller: controller,
          );
  }
}
