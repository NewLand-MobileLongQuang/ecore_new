
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sip_ua/sip_ua.dart';
import '../../common/widgets/popup_item.dart';
import '../../modules/auth/domain/entities/session_info.dart';
import '../../modules/auth/domain/usecases/save_session_info.dart';
import '../../res/colors.dart';
import '../../res/media_res.dart';
import '../../res/text_styles.dart';
import '../../extensions/context_extension.dart';
import '../../services/injection/injection_container.dart';
import '../../utils/string_generate.dart';

class MainAppBarBK extends StatelessWidget implements PreferredSizeWidget,
 SipUaHelperListener
{
  const MainAppBarBK({required this.title, required this.isHeader, super.key});

  final String title;
  final bool isHeader;





  @override
  Widget build(BuildContext context) {
    final avatar = context.currentUser != null ? context.currentUser?.Avatar ?? '' : '';

    final state=context.callProvider.helper?.registerState.state.toString();
    return AppBar(
      leading:
          IconButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            icon: isHeader == true
                ? SvgPicture.asset(AppMediaRes.iconLogo)
                : const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.textWhiteColor,
                ),
          ),
      title: Text(
        title,
        style: AppTextStyles.textStyleInterW500S18White,
      ),
      actions: [
        IconButton(onPressed: () {}, icon: SvgPicture.asset(AppMediaRes.iconChat)),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(AppMediaRes.iconNotification)),
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
                    ? StringGenerate.getCurrentName(context.currentUser?.Name ?? '').toUpperCase()
                    : 'LT',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          itemBuilder: (_) => [
            PopupMenuItem<void>(
              child:  PopupItem(
                //title: 'Edit Profile',
                title: '${state}',
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
                    )
                  ),
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
  //
  // Widget itemLanguage(String title, String flag, BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => sl<ProfileCubit>(),
  //     child: BlocBuilder<ProfileCubit, ProfileState>(
  //       builder: (context, state) {
  //         return InkWell(
  //           onTap: () {
  //             context.read<ProfileCubit>().changeLanguage(title);
  //             Navigator.pop(context);
  //           },
  //           child: Row(
  //             children: [
  //               Expanded(child: Container()),
  //               Text(
  //                 title,
  //                 style: const TextStyle(
  //                   color: AppColors.textBlackColor,
  //                   fontSize: 20,
  //                 ),
  //               ),
  //               const SizedBox(width: 8),
  //               Image.asset(
  //                 flag,
  //                 height: 28,
  //               ),
  //               Expanded(child: Container()),
  //             ],
  //           ),
  //         );
  //       },
  //     )
  //   );
  // }
  //


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  void callStateChanged(Call call, CallState state) {
    // TODO: implement callStateChanged
  }


  @override
  void onNewMessage(SIPMessageRequest msg) {
    // TODO: implement onNewMessage
  }

  @override
  void onNewNotify(Notify ntf) {
    // TODO: implement onNewNotify
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    // TODO: implement registrationStateChanged
  }

  @override
  void transportStateChanged(TransportState state) {
    // TODO: implement transportStateChanged

  }

}
