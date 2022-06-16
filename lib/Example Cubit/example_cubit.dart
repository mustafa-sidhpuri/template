import 'dart:async';

import 'package:bloc/bloc.dart';

import '../Internet Cubit/constants.dart';
import '../Internet Cubit/internet_cubit.dart';
import '../Internet Cubit/internet_state.dart';
import 'example_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(const CounterState(counter: 0, wasIncremented: false)) {
    monitorConnectivity();
  }

  monitorConnectivity() {
    // listening to the InternetCubit with help of stream subscription and deciding based on that we increment or decrement the number
    // Note: This just an example. you can do many more things.
    return internetStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }

  void increment() =>
      emit(CounterState(counter: state.counter + 1, wasIncremented: true));

  void decrement() =>
      emit(CounterState(counter: state.counter - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
