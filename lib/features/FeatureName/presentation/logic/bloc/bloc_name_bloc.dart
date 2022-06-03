import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_name_event.dart';
part 'bloc_name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(NameInitial()) {
    on<NameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
