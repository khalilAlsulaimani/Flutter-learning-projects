import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'products.dart';

void main() {
  runApp(
    ChangeNotifierProvider<Products>(
      create: (_) => Products(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        cardColor: Colors.blueGrey[400],
        canvasColor: Colors.blueGrey.withOpacity(0.2),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
