import 'package:ecore/src/call/presentation/cubit/call_forward_cubit.dart';
import 'package:ecore/src/call/presentation/widgets/call_forward_number_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/main_app_bar.dart';
import '../../../../core/res/colors.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/services/injection_container.dart';
import '../widgets/call_forward_agent_view.dart';

class CallForwardScreen extends StatefulWidget {
  const CallForwardScreen({super.key});

  static const routeName = '/forward';

  @override
  State<CallForwardScreen> createState() => _CallForwardScreenState();
}

class _CallForwardScreenState extends State<CallForwardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: const MainAppBar(
            title: "AppStrings.call",
            isHeader: false,
          ),
          body: BlocProvider(
            create: (context) => CallForwardCubit(getAgentList: sl(), redirectCurrentCall: sl())..init(),
            child: Column(children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  tabs: const [
                    Tab(
                      text: 'Agent',
                    ),
                    Tab(
                      text: 'Điện thoại',
                    ),
                  ],
                  indicatorColor: AppColors.primaryColor,
                  labelColor: AppColors.primaryColor,
                  labelStyle: AppTextStyles.textStyleInterW500S14Black,
                ),
              ),
              Expanded(
                child: BlocConsumer<CallForwardCubit, CallForwardState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return TabBarView(
                      children: [
                        state.status==CallForwardStatuses.success?
                        CallForwardAgentView(dataList: state.agentList):
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        CallForwardNumberView(),
                      ],
                    );
                  },
                ),
              ),
            ]),
          )),
    );
  }
}
