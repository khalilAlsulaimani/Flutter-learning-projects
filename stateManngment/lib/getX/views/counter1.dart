import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class Counter1 extends StatelessWidget {
  const Counter1({Key? key}) : super(key: key);


  //final CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: SizedBox(
        width: 150,
        height: 150,
        child: GetX<CounterController>(
          builder:(_counterController)=> Center(
            child: Text(
              _counterController.counter.value.toString(),
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
