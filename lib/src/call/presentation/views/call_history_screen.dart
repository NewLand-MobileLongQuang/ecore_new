import 'package:ecore/src/call/presentation/widgets/call_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/main_app_bar.dart';
import '../../../../core/services/injection/injection_container.dart';
import '../cubit/call_history_cubit.dart';

class CallHistoryScreen extends StatefulWidget {
  static const routeName = '/call_history';

  const CallHistoryScreen({super.key});
  @override
  State<CallHistoryScreen> createState() => _CallInViewState();
}

class _CallInViewState extends State<CallHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Lịch sử cuộc gọi',
        isHeader: false,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => CallHistoryCubit(getCallLog: sl())..init(),
        child: BlocConsumer<CallHistoryCubit, CallHistoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == CallHisrotyStatuses.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == CallHisrotyStatuses.success) {
              return CallHistoryList(
                dataList: state.dataList ?? [],
              );
            }

            return Expanded(child: Container());
          },
        ),
      ),
    );
  }
}
