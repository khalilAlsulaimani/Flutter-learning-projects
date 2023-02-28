import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/bloc/bloc/counter_bloc.dart';

class Counter2 extends StatelessWidget {
  const Counter2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: SizedBox(
        width: 150,
        height: 150,
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count) => Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
