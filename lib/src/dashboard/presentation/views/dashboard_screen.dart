import 'package:ecore/src/call/presentation/views/call_screen.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:ecore/src/e_service/index/presentation/views/e_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/widgets/main_app_bar.dart';
import '../../../../core/res/colors.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/utils/apps.dart';
import '../providers/dashboard_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(builder: (_, controller, __) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const MainAppBar(title: 'Home', isHeader: true,),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: Apps.listApps.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (BuildContext context, int index){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        if(Apps.listApps[index].title == 'E-Service') {
                          Navigator.pushNamed(context, EserviceUtils.getFullRouteName(EServiceScreen.routeName));
                        }
                        if(Apps.listApps[index].title == 'SkyCS') {
                          Navigator.pushNamed(context, CallScreen.routeName);
                        }
                      },
                      child: Image.asset(
                        Apps.listApps[index].image,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Apps.listApps[index].title,
                      style: AppTextStyles.textStyleInterW400S16Black,
                      maxLines: 2,
                    ),
                  ],
                );
              },
            ),
          )
      );
    });
  }
}
