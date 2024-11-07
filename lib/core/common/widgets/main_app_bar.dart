import 'package:ecore/core/services/audio_service.dart';
import 'package:ecore/src/call/presentation/views/incall_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sip_ua/sip_ua.dart';
import '../../common/widgets/popup_item.dart';
import '../../modules/auth/domain/entities/session_info.dart';
import '../../modules/auth/domain/usecases/save_session_info.dart';
import '../../res/colors.dart';
import '../../res/media_res.dart';
import '../../res/text_styles.dart';
import '../../extensions/context_extension.dart';
import '../../services/injection_container.dart';
import '../../services/local_notification_service.dart';
import '../../utils/string_generate.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title, required this.isHeader, this.backButton=true});

  final String title;
  final bool isHeader;
  final bool backButton;

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar>
    implements SipUaHelperListener {
  late RegistrationState _registerState;
  SIPUAHelper? get helper => context.callProvider.helper;

  @override
  Widget build(BuildContext context) {
    final avatar =
        context.currentUser != null ? context.currentUser?.Avatar ?? '' : '';

    final state = context.callProvider.helper?.registerState.state.toString();
    return AppBar(
      leading: widget.backButton? IconButton(
        onPressed: () {
          Navigator.of(context).maybePop();
        },
        icon: widget.isHeader == true
            ? SvgPicture.asset(AppMediaRes.iconLogo)
            : const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.textWhiteColor,
              ),
      ): null,
      title: Text(
        //'Register Status: ${EnumHelper.getName(_registerState.state)}',
        widget.title,
        style: AppTextStyles.textStyleInterW500S18White,
      ),
      actions: [
        // IconButton(onPressed: () {}, icon: SvgPicture.asset(AppMediaRes.iconChat)),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppMediaRes.iconNotification)),
        PopupMenuButton(
          offset: const Offset(0, 50),
          surfaceTintColor: Colors.white,
          icon: avatar != ''
              ? CircleAvatar(radius: 16, backgroundImage: NetworkImage(avatar))
              : CircleAvatar(
                  radius: 16,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      avatar == ''
                          ? StringGenerate.getCurrentName(
                                  context.currentUser?.Name ?? '')
                              .toUpperCase()
                          : 'LT',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
          itemBuilder: (_) => [
            PopupMenuItem<void>(
              child: PopupItem(
                title: 'Edit Profile',
                //title: '${state}',
                icon: Icon(
                  Icons.edit_outlined,
                  color: AppColors.textBlackColor,
                ),
              ),
              onTap: () {
                // context.push(
                //     BlocProvider(create: (_)=>sl<ProfileCubit>(),
                //       child: const EditProfileScreen(),)
                // );
              },
            ),
            PopupMenuItem<void>(
              height: 1,
              padding: EdgeInsets.zero,
              child: Divider(
                height: 1,
                color: Colors.grey.shade50,
                endIndent: 16,
                indent: 16,
              ),
            ),
            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Language',
                icon: Icon(
                  Icons.language,
                  color: AppColors.textBlackColor,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //itemLanguage('VI', AppMediaRes.iconVietnamFlag, context),
                      const SizedBox(height: 16),
                      // itemLanguage('EN', AppMediaRes.iconEnglishFlag, context),
                      // const SizedBox(height: 16),
                      // itemLanguage('JP', AppMediaRes.iconJapanFlag, context),
                      // const SizedBox(height: 16),
                      // itemLanguage('CN', AppMediaRes.iconChinaFlag, context),
                    ],
                  )),
                );
              },
            ),
            PopupMenuItem<void>(
              height: 1,
              padding: EdgeInsets.zero,
              child: Divider(
                height: 1,
                color: Colors.grey.shade50,
                endIndent: 16,
                indent: 16,
              ),
            ),
            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Log out',
                icon: Icon(
                  Icons.logout,
                  color: AppColors.textBlackColor,
                ),
              ),
              onTap: () {
                context.sessionProvider.initSession(null);
                sl<SaveSessionInfo>()(null);
                SessionInfo.reset();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            )
          ],
        ),
      ],
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.textWhiteColor,
    );
  }

  @override
  void initState() {
    super.initState();

    _registerState = helper!.registerState;
    helper!.addSipUaHelperListener(this);
  }

  @override
  void deactivate() {
    super.deactivate();
    helper!.removeSipUaHelperListener(this);
  }

  @override
  void callStateChanged(Call call, CallState callState) {
    if (callState.state == CallStateEnum.CALL_INITIATION) {
      if (call.direction == 'INCOMING') {
        AudioService().playSound('audio/ringing.mp3', true);
        LocalNotificationService().newNotification( message: 'Incoming call', detail:'Called from: ${call.remote_identity}');
      }
      Navigator.pushNamed(context, IncallScreen.routeName, arguments: call);
    } else if (call.direction == 'INCOMING' &&
        (callState.state == CallStateEnum.FAILED ||
            callState.state == CallStateEnum.ENDED ||
            callState.state == CallStateEnum.ACCEPTED)) {
      AudioService().stopPlaying();
      LocalNotificationService().newNotification( message: 'Ecore', detail:'Registration state: Online');
    }
  }

  @override
  void transportStateChanged(TransportState state) {}

  @override
  void onNewMessage(SIPMessageRequest msg) {
    // NO OP
  }

  @override
  void onNewNotify(Notify ntf) {
    // NO OP
  }
  @override
  void registrationStateChanged(RegistrationState state) async {
    // final service = FlutterBackgroundService();
    // bool isRunning = await service.isRunning();
    // if (isRunning)
    //   service.invoke('stop');
    // else
    //   service.startService();

    setState(() {
      _registerState = state;
    });

    LocalNotificationService().newNotification( message: 'Ecore', detail:'Registration state: ${state.state?.name}', silent: false);
  }
}
