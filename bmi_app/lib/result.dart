import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resulText = '';
    if (result >= 30) {
      resulText = 'Obease';
    } else if (result > 25 && result < 30) {
      resulText = 'Overweight';
    } else if (result > 18.5 && result < 24.9) {
      resulText = 'normal';
    } else {
      resulText = 'Thin';
    }
    return resulText;
  }

  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Gender : ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline1),
            Text('Reslut : ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headline1),
            Text('Age : $age', style: Theme.of(context).textTheme.headline1),
            Text(
              'Healthiness : $resultPhrase ',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ],
        )),
      ),
    );
  }
}
