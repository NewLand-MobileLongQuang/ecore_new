import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'incall_dialpad_state.dart';

class IncallDialpadCubit extends Cubit<IncallDialpadState> {
  IncallDialpadCubit() : super(IncallDialpadInitial());

  Future<void> input(String number) async {
    emit(IncallDialpadInputLoaded(phoneNumber: number));
  }

  Future<void> call(String hotline, String phoneNumber) async {
    emit(IncallDialpadCalling(hotline: hotline, phoneNumber: phoneNumber));
    await Future.delayed(const Duration(seconds: 1));
    emit(IncallDialpadCallSuccess(hotline: hotline, phoneNumber: phoneNumber));
  }

}