import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:state/bloc/bloc/counter_bloc.dart';

import 'dashboard.dart';

class CounterBPro extends StatelessWidget {
   CounterBPro({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: Center(
        child: Dashboard(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<CounterBloc>().increament();
        },
      ),
    );
  }
}
