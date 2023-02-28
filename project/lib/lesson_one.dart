import 'package:flutter/material.dart';

class LessonOne extends StatelessWidget {
  const LessonOne({Key? key}) : super(key: key);

  buttonOnPressed(msg) {
    print('Clicked button! $msg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0,
          leading: const Icon(
            Icons.center_focus_weak_sharp,
            color: Colors.red,
          ),
          title: const Text('Home Page'),
          actions: const [
            Icon(Icons.center_focus_weak_sharp),
            Icon(Icons.center_focus_weak_sharp),
            Icon(Icons.center_focus_weak_sharp),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          //color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello World!'),
                  Text(
                    'Hello World!',
                    style: TextStyle(
                      color: Colors.red,
                      //backgroundColor: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      wordSpacing: 20,
                      letterSpacing: 1,
                      height: 1,
                      shadows: const [
                        Shadow(
                          offset: Offset(3, 4),
                          color: Colors.yellow,
                          blurRadius: 10,
                        ),
                        Shadow(
                          offset: Offset(3, 4),
                          color: Colors.yellow,
                          blurRadius: 10,
                        ),
                      ],
                      decoration: TextDecoration.combine([
                        TextDecoration.underline,
                        TextDecoration.overline,
                        //TextDecoration.lineThrough,
                      ]),
                      decorationColor: Colors.black,
                      decorationStyle: TextDecorationStyle.wavy,
                    ),
                  ),
                  const Text('Hello World!'),
                ],
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text('A')),
                  OutlinedButton(onPressed: () {}, child: const Text('B')),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('C'),
                  )
                ],
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.night_shelter),
                    label: const Text('A'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.night_shelter),
                    label: const Text('A'),
                    autofocus: true,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(5, 0, 10, 30)),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    onPressed: null,
                    icon: const Icon(
                      Icons.night_shelter,
                      //color: Colors.blue,
                    ),
                    label: const Text('A'),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      buttonOnPressed('Hello');
                    },
                    icon: const Icon(Icons.center_focus_weak_sharp),
                  ),
                  IconButton(
                      onPressed: () => print('Button Clicked!'),
                      icon: const Icon(Icons.center_focus_weak_sharp)),
                  FloatingActionButton.extended(
                    label: const Text('Add'),
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      side: BorderSide(color: Colors.red, width: 6),
                    ),
                    splashColor: Colors.yellow,
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Add'),
          icon: const Icon(Icons.add),
          onPressed: () {},
          backgroundColor: Colors.black,
          foregroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
            side: BorderSide(color: Colors.red, width: 6),
          ),
          splashColor: Colors.yellow,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}
