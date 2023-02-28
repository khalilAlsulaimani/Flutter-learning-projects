import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text('Home'),
          actions: const [
            Icon(Icons.access_alarm),
            Icon(Icons.notifications),
            Icon(Icons.search),
          ],
          centerTitle: true,
          backgroundColor: Colors.yellow[600],
          elevation: 0,
        ),
        body: const Text('data'),
      ),
    );
  }
}
