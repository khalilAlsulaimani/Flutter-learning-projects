import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import 'counter_provider.dart';
import 'dashboard.dart';


final counterProvider = StateNotifierProvider<Counter, int>((_)=> Counter());

class CounterRPro extends StatelessWidget {
  const CounterRPro({Key? key}) : super(key: key);

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
          context.read(counterProvider.notifier).increament();
        },
      ),
    );
  }
}
