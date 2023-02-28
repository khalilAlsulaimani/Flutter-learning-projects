import 'package:flutter/material.dart';
import 'dart:math';
import 'result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double hightValue = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    const SizedBox(width: 15),
                    m1Expanded(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                          style: Theme.of(context).textTheme.headline2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(hightValue.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.headline1),
                            Text(' Cm',
                                style: Theme.of(context).textTheme.bodyText1),
                          ]),
                      Slider(
                          value: hightValue,
                          min: 50,
                          max: 300,
                          onChanged: (newValue) {
                            setState(() {
                              hightValue = newValue;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'wight'),
                    const SizedBox(width: 15),
                    m2Expanded(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
                color: Colors.teal,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: TextButton(
                    onPressed: () {
                      var result = weight / pow(hightValue / 100, 2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Result(
                            age: age,
                            isMale: isMale,
                            result: result,
                          );
                        }),
                      );
                    },
                    child: Text(
                      'calculate',
                      style: Theme.of(context).textTheme.headline2,
                    ))),
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => {
          setState(() {
            isMale = (type == 'male') ? true : false;
          })
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') | (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(type == "male" ? Icons.male : Icons.female, size: 90),
              const SizedBox(height: 30),
              Text(
                type == "male" ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        // height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //const SizedBox(height: 20),
            Text(
              type == "age" ? 'Age' : 'Weight(kg)',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 15),
            Text(
              type == "age" ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == "age" ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      type == "age" ? age++ : weight++;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 15),
                FloatingActionButton(
                  heroTag: type == "age" ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == "age" ? age-- : weight--;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
