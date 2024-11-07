import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'incall_state.dart';

class IncallCubit extends Cubit<IncallState> {
  IncallCubit() : super(IncallInitial());

  void toggleKeypad(bool show){
    if(show)emit(IncallDialpad());
    else emit(IncallInitial());

  }
}

