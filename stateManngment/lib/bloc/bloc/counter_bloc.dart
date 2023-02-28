import 'package:flutter_bloc/flutter_bloc.dart';


class CounterBloc extends Cubit<int>{
  CounterBloc() : super(0);

  void increament() => emit(state+1);

}