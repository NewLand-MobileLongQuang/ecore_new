import 'package:ecore/src/call/presentation/views/incall_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../fake_data/fake_data_eTicket.dart';
import '../cubit/dialpad_cubit.dart';
import 'dialpad_calling.dart';
import 'dialpad_input_loaded.dart';
import 'dialpad_succes.dart';

class DialpadView extends StatefulWidget {
  const DialpadView({super.key});

  @override
  State<DialpadView> createState() => _DialpadViewState();
}

class _DialpadViewState extends State<DialpadView> {
  final List<String> listCall = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#'
  ];
  //String get dropdownValue =

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DialpadCubit()..input(''),
      child: BlocConsumer<DialpadCubit, DialpadState>(
        listener: (context, state) {
          if (state is DialpadCalling) {
            //Navigator.pushReplacementNamed(context, IncallScreen.routeName);
          }
        },
        builder: (context, state) {
          if (state is DialpadLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DialpadInputLoaded) {
            return const DialpadInputLoadedView();
          }
          if (state is DialpadCalling) {
            return const DialpadCallingView();
          }
          if (state is DialpadCallSuccess) {
            return const DialpadCallSuccessView();
          }
          return Expanded(child: Container());
        },
      ),
    );
  }
}
