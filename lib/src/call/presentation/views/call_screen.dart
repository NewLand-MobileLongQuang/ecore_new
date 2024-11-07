import 'dart:developer';

import 'package:ecore/core/extensions/context_extension.dart';
import 'package:ecore/src/call/presentation/widgets/call_internal_view.dart';
import 'package:ecore/src/call/presentation/widgets/dialpad_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/main_app_bar.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/text_styles.dart';




class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  static const routeName = '/call';

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //final s= context.callProvider.helper?.registered;

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          appBar: const MainAppBar(title: 'Gọi điện', isHeader: false,),
          backgroundColor: Colors.white,
          body: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TabBar(
                    tabs: const [
                      Tab(
                        text: 'Gọi ra',
                      ),
                      Tab(
                        text: 'Gọi nội bộ',
                      ),

                    ],
                    indicatorColor: AppColors.primaryColor,
                    labelColor: AppColors.primaryColor,
                    labelStyle: AppTextStyles.textStyleInterW500S14Black,
                  ),
                ),
                const Expanded(
                  child: TabBarView(

                    children: [
                      DialpadView(),

                      CallInternalView(),


                    ],
                  ),
                ),
              ]
          )
      ),
    );
  }
}
