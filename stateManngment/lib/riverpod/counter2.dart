import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'counter_pro.dart';

class Counter2 extends HookWidget {
  const Counter2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useProvider(counterProvider);
    return Card(
      elevation: 6,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Center(
          child: Text(
            count.toString(),
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
