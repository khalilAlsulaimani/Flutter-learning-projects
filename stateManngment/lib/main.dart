import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bloc/bloc/counter_bloc.dart';
import 'bloc/ui/counterb_pro.dart';
import 'riverpod/counter_pro.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(CounterController());
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ChangeNotifierProvider(
      //   create: (_) => CounterProvider(),
      //   child: const CounterPro(),
      // ),
      //home: CounterXPro(),

      // home: BlocProvider(
      //   create: (_) => CounterBloc(),
      //   child: CounterBPro(),
      // ),

      home: ProviderScope(
        child: CounterRPro(),
      ),
    );
  }
}
