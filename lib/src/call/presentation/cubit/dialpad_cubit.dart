import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'dialpad_state.dart';


class DialpadCubit extends Cubit<DialpadState> {
  DialpadCubit() : super(DialpadInitial());

  Future<void> input(String number) async {
    emit(DialpadInputLoaded(phoneNumber: number));
  }

  Future<void> call(String hotline, String phoneNumber) async {
    emit(DialpadCalling(hotline: hotline, phoneNumber: phoneNumber));
    await Future.delayed(const Duration(seconds: 1));
    emit(DialpadCallSuccess(hotline: hotline, phoneNumber: phoneNumber));
  }

}
