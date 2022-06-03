import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cubit_name_state.dart';

class NameCubit extends Cubit<NameState> {
  NameCubit() : super(NameInitial());
}
