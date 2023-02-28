
import 'package:riverpod/riverpod.dart';

class Counter extends StateNotifier<int>{
  Counter() : super(0);

  void increament() => state++;
}
