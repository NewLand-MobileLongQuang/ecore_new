import 'package:ecore/core/common/widgets/loading_view.dart';
import 'package:ecore/core/extensions/context_extension.dart';
import 'package:ecore/src/account/presentation/cubit/init_session_cubit.dart';
import 'package:ecore/src/account/presentation/views/login_screen.dart';
import 'package:ecore/src/account/presentation/views/select_network_screen.dart';
import 'package:ecore/src/call/presentation/views/call_register_screen.dart';
import 'package:ecore/src/dashboard/presentation/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/core_utils.dart';

class InitSessionScreen extends StatefulWidget {
  const InitSessionScreen({super.key});

  @override
  State<InitSessionScreen> createState() => _InitSessionScreenState();
}

class _InitSessionScreenState extends State<InitSessionScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<InitSessionCubit>();
    cubit.init();
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<InitSessionCubit, InitSessionState>(listener: (context, state) {
        if (state is InitSessionLogin) {
          CoreUtils.showSnackBar(context, 'login');
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        } else if (state is InitSessionSelectNetwork) {
          CoreUtils.showSnackBar(context, 'select network');
          Navigator.pushReplacementNamed(context, SelectNetworkScreen.routeName);
        } else if (state is InitSessionInitCall) {
          //Navigator.pushReplacementNamed(context, CallRegisterScreen.routeName);
        } else if (state is InitSessionSaveSession) {
          context.sessionProvider.initSession(state.sessionInfo);
          if (state.sessionInfo.callingInfo != null) {
            Navigator.pushReplacementNamed(
                context, CallRegisterScreen.routeName,
                arguments: state.sessionInfo);
            //Navigator.pushReplacementNamed(context, Dashboard.routeName);
          }
          else {
            CoreUtils.showSnackBar(context, 'No calling information');
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          }
        } else if (state is InitSessionOk) {
          CoreUtils.showSnackBar(context, 'InitSessionOk');
          Navigator.pushReplacementNamed(context, Dashboard.routeName);
        }
      }, builder: (context, state) {
        return const LoadingView();
      }),
    );
  }
}
