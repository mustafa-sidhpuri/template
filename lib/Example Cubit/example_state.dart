import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int counter;
  final bool wasIncremented;
  const CounterState({required this.counter,required this.wasIncremented});
  //
  @override
  List<Object?> get props => [counter];
}