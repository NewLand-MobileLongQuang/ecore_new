import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/injection_container.dart';
import '../cubit/call_internal_cubit.dart';
import 'call_internal_agent_view.dart';




class CallInternalView extends StatefulWidget {
  const CallInternalView({super.key});
  @override
  State<CallInternalView> createState() => CallInternalViewState();
}

class CallInternalViewState extends State<CallInternalView> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CallInternalCubit(getAgentList: sl())..init(),
      child: BlocConsumer<CallInternalCubit, CallInternalState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if(state.status== CallInternalStatuses.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state.status== CallInternalStatuses.success) {
            return CallInternalAgentView(dataList: state.agentList??[],);
          }


          return Expanded(child: Container());
        },
      ),

    );
  }
}
