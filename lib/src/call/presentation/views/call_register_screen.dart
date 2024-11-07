import 'package:ecore/core/common/widgets/restart_widget.dart';
import 'package:ecore/core/extensions/context_extension.dart';
import 'package:ecore/src/account/presentation/views/login_screen.dart';
import 'package:ecore/src/call/presentation/cubit/call_register_cubit.dart';
import 'package:ecore/src/call/presentation/views/call_screen.dart';
import 'package:ecore/src/dashboard/presentation/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loading_view.dart';
import '../../../../core/modules/auth/domain/entities/session_info.dart';
import '../../../../core/utils/core_utils.dart';



class CallRegisterScreen extends StatefulWidget {
  const CallRegisterScreen({Key? key}):super(key: key);

  //final SessionInfo sessionInfo;
  static const routeName = '/call_register';

  @override
  State<CallRegisterScreen> createState() => _CallRegisterScreenState();
}

class _CallRegisterScreenState extends State<CallRegisterScreen> {
  @override
  Widget build(BuildContext context) {

    var cubit = context.read<CallRegisterCubit>();


      cubit.register(context.sessionInfo!, context.callProvider);


    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<CallRegisterCubit, CallRegisterState>(
          listener: (context, state) {
            if (state is CallRegisterInitial) {
             // var cubit = context.read<CallRegisterCubit>();

              //cubit.register();
            }

            else if (state is CallRegisterError) {
              CoreUtils.showSnackBar(context, 'Register Error');
              //Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              RestartWidget.restartApp(context);
            }
            else if (state is CallRegisterSuccess) {
              CoreUtils.showSnackBar(context, 'Register Success');
              //Navigator.pushReplacementNamed(context, CallScreen.routeName);
              Navigator.pushReplacementNamed(context, Dashboard.routeName);
            }
          }, builder: (context, state) {
        return const LoadingView();
      }),
    );
  }
}
