import 'dart:async';

import 'package:ecore/core/extensions/context_extension.dart';
import 'package:ecore/core/services/audio_service.dart';
import 'package:ecore/src/call/presentation/cubit/incall_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sip_ua/sip_ua.dart';

import '../../../../../core/common/widgets/main_app_bar.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../core/res/media_res.dart';

import '../widgets/incall_dialpad.dart';
import 'forward_screen.dart';

class IncallScreen extends StatefulWidget {
  IncallScreen(this._call, {Key? key}) : super(key: key);

  static const routeName = '/incall';
  final Call? _call;
  @override
  State<IncallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<IncallScreen>
    implements SipUaHelperListener {
  late Timer _timer;

  RTCVideoRenderer? _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer? _remoteRenderer = RTCVideoRenderer();
  double? _localVideoHeight;
  double? _localVideoWidth;
  EdgeInsetsGeometry? _localVideoMargin;
  MediaStream? _localStream;
  MediaStream? _remoteStream;

  bool _showNumPad = false;
  String _timeLabel = '00:00';
  bool _audioMuted = false;
  bool _videoMuted = false;
  bool _speakerOn = false;
  bool _hold = false;
  bool _mirror = true;
  String? _holdOriginator;
  CallStateEnum _state = CallStateEnum.NONE;

  SIPUAHelper? get helper => context.callProvider.helper;

  String? get remoteIdentity => call!.remote_identity;

  String get direction => call!.direction;

  Call? get call => widget._call;

  static const kIsWeb = false;

  @override
  void initState() {
    super.initState();
    if (call?.state == CallStateEnum.FAILED ||
        call?.state == CallStateEnum.ENDED) {
      Navigator.of(context).pop();
    } else {
      helper!.addSipUaHelperListener(this);
      _startTimer();
    }
  }

  @override
  deactivate() {
    super.deactivate();
    helper!.removeSipUaHelperListener(this);
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      Duration duration = Duration(seconds: timer.tick);
      if (mounted) {
        setState(() {
          _timeLabel = [duration.inMinutes, duration.inSeconds]
              .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
              .join(':');
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void _initRenderers() async {
    if (_localRenderer != null) {
      await _localRenderer!.initialize();
    }
    if (_remoteRenderer != null) {
      await _remoteRenderer!.initialize();
    }
  }

  void _disposeRenderers() {
    if (_localRenderer != null) {
      _localRenderer!.dispose();
      _localRenderer = null;
    }
    if (_remoteRenderer != null) {
      _remoteRenderer!.dispose();
      _remoteRenderer = null;
    }
  }

  void _resizeLocalVideo() {
    _localVideoMargin = _remoteStream != null
        ? EdgeInsets.only(top: 15, right: 15)
        : EdgeInsets.all(0);
    _localVideoWidth = _remoteStream != null
        ? MediaQuery.of(context).size.width / 4
        : MediaQuery.of(context).size.width;
    _localVideoHeight = _remoteStream != null
        ? MediaQuery.of(context).size.height / 4
        : MediaQuery.of(context).size.height;
  }

  void _handleStreams(CallState event) async {
    MediaStream? stream = event.stream;
    if (event.originator == 'local') {
      if (_localRenderer != null) {
        _localRenderer!.srcObject = stream;
      }
      //if (!kIsWeb && !WebRTC.platformIsDesktop) {
      event.stream?.getAudioTracks().first.enableSpeakerphone(false);
      //}
      _localStream = stream;
    }
    if (event.originator == 'remote') {
      if (_remoteRenderer != null) {
        _remoteRenderer!.srcObject = stream;
      }
      _remoteStream = stream;
    }

    setState(() {
      _resizeLocalVideo();
    });
  }

  void _handleAccept() async {
    AudioService().stopPlaying();
    bool remoteHasVideo = call!.remote_has_video;
    final mediaConstraints = <String, dynamic>{
      'audio': true,
      'video': remoteHasVideo
    };
    MediaStream mediaStream;

    if (kIsWeb && remoteHasVideo) {
      mediaStream =
          await navigator.mediaDevices.getDisplayMedia(mediaConstraints);
      mediaConstraints['video'] = false;
      MediaStream userStream =
          await navigator.mediaDevices.getUserMedia(mediaConstraints);
      mediaStream.addTrack(userStream.getAudioTracks()[0], addToNative: true);
    } else {
      mediaConstraints['video'] = remoteHasVideo;
      mediaStream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    }

    call!.answer(helper!.buildCallOptions(!remoteHasVideo),
        mediaStream: mediaStream);
  }

  void _handleHangup() {
    AudioService().stopPlaying();

    call!.hangup({'status_code': 603});
    _timer.cancel();
  }

  void _muteAudio() {
    if (_audioMuted) {
      call!.unmute(true, false);
    } else {
      call!.mute(true, false);
    }
  }

  void _handleHold() {
    if (_hold) {
      call!.unhold();
    } else {
      call!.hold();
    }
  }

  void _toggleSpeaker() {
    if (_localStream != null) {
      _speakerOn = !_speakerOn;
      if (!kIsWeb) {
        _localStream!.getAudioTracks()[0].enableSpeakerphone(_speakerOn);
      }
    }
  }

  void _cleanUp() {
    if (_localStream == null) return;
    _localStream?.getTracks().forEach((track) {
      track.stop();
    });
    _localStream!.dispose();
    _localStream = null;
  }

  void _backToDialPad() {
    AudioService().stopPlaying();
    _timer.cancel();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
    _cleanUp();
  }

  @override
  void callStateChanged(Call call, CallState callState) {
    if (callState.state == CallStateEnum.HOLD ||
        callState.state == CallStateEnum.UNHOLD) {
      _hold = callState.state == CallStateEnum.HOLD;
      _holdOriginator = callState.originator;
      setState(() {});
      return;
    }

    if (callState.state == CallStateEnum.MUTED) {
      if (callState.audio!) _audioMuted = true;
      if (callState.video!) _videoMuted = true;
      setState(() {});
      return;
    }

    if (callState.state == CallStateEnum.UNMUTED) {
      if (callState.audio!) _audioMuted = false;
      if (callState.video!) _videoMuted = false;
      setState(() {});
      return;
    }

    if (callState.state != CallStateEnum.STREAM) {
      _state = callState.state;
    }

    switch (callState.state) {
      case CallStateEnum.STREAM:
        _handleStreams(callState);
        break;
      case CallStateEnum.ENDED:
      case CallStateEnum.FAILED:
        _backToDialPad();
        break;
      case CallStateEnum.UNMUTED:
      case CallStateEnum.MUTED:
      case CallStateEnum.CONNECTING:
      case CallStateEnum.PROGRESS:
      case CallStateEnum.ACCEPTED:
      case CallStateEnum.CONFIRMED:
      case CallStateEnum.HOLD:
      case CallStateEnum.UNHOLD:
      case CallStateEnum.NONE:
      case CallStateEnum.CALL_INITIATION:
      case CallStateEnum.REFER:
        break;
    }
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          appBar: const MainAppBar(
            title: 'Gọi điện',
            isHeader: true,
          ),
          body: BlocProvider(
            create: (context) => IncallCubit()..toggleKeypad(false),
            child: BlocConsumer<IncallCubit, IncallState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit = context.read<IncallCubit>();
                return Column(children: [
                  const SizedBox(height: 16),
                  Text(
                    //'state.hotline',
                    context.sessionInfo!.callingInfo!.CalloutNumber ?? '',
                    style: AppTextStyles.textStyleInterW400S28Black,
                  ),
                  //SizedBox(height: 8),
                  Text(
                    //'đang gọi...',
                    _timeLabel,
                    style: AppTextStyles.textStyleInterW400S16Grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    //'state.hotline',
                    call?.remote_identity ?? '',
                    style: AppTextStyles.textStyleInterW400S28Black,
                  ),
                  const SizedBox(height: 16),

                  state is IncallDialpad
                      ? IncallDialpadView()
                      : const SizedBox(height: 0),

                  const SizedBox(height: 32),
                  state is! IncallDialpad
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _muteAudio();
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(27),
                                      decoration: BoxDecoration(
                                        color: !_audioMuted
                                            ? AppColors.primaryOpa11
                                            : AppColors.textGreenColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                          AppMediaRes.iconMic)),
                                ),
                                Text(
                                  _audioMuted ? 'bật mic' : 'tắt mic',
                                  style:
                                      AppTextStyles.textStyleInterW500S14Black,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _handleHold();
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(27),
                                      decoration: BoxDecoration(
                                        color: !_hold
                                            ? AppColors.primaryOpa11
                                            : AppColors.textGreenColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                          AppMediaRes.iconPause02)),
                                ),
                                Text(
                                  !_hold ? 'giữ cuộc gọi' : 'bỏ giữ',
                                  style:
                                      AppTextStyles.textStyleInterW500S14Black,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    cubit.toggleKeypad(true);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(27),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryOpa11,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                          AppMediaRes.iconKeyboard)),
                                ),
                                Text(
                                  'bàn phím',
                                  style:
                                      AppTextStyles.textStyleInterW500S14Black,
                                )
                              ],
                            )
                          ],
                        )
                      : const SizedBox(height: 0),
                  const SizedBox(height: 32),
                  state is! IncallDialpad
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, CallForwardScreen.routeName);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(27),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryOpa11,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                          AppMediaRes.iconCall4)),
                                ),
                                Text(
                                  'chuyển',
                                  style:
                                      AppTextStyles.textStyleInterW500S14Black,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.all(27),
                                      decoration: const BoxDecoration(
                                        color: AppColors.greyLightColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        AppMediaRes.iconPersonGroup02,
                                      )),
                                ),
                                // CallRoundedButton(
                                //   state: CallRoundedButton.STATE_INACTIVE,
                                //     child: SvgPicture.asset(
                                //   AppMediaRes.iconPersonGroup02,
                                // )),
                                Text(
                                  'nhóm',
                                  style:
                                      AppTextStyles.textStyleInterW500S14Black,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.all(27),
                                      decoration: const BoxDecoration(
                                        color: AppColors.greyLightColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                          AppMediaRes.iconTicket02)),
                                ),
                                Text(
                                  'eTicket',
                                  style:
                                      AppTextStyles.textStyleInterW500S14Black,
                                )
                              ],
                            )
                          ],
                        )
                      : const SizedBox(height: 0),
                  const SizedBox(height: 48),

                  Row(
                      mainAxisAlignment: direction == 'INCOMING'
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.center,
                      children: <Widget>[
                        direction == 'INCOMING'
                            ? InkWell(
                                onTap: () {
                                  _handleAccept();
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(27),
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppMediaRes.iconCall2,
                                      height: 20,
                                      width: 20,
                                    )),
                              )
                            : SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        InkWell(
                          onTap: () {
                            _handleHangup();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(27),
                              decoration: const BoxDecoration(
                                color: AppColors.buttonRedColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppMediaRes.iconCall3,
                              )),
                        ),
                      ]),
                ]);
              },
            ),
          )),
    );
  }
}
