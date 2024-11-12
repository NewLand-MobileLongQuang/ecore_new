import 'package:audioplayers/audioplayers.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/core/utils/string_generate.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_call_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalledView extends StatefulWidget {
  const CalledView({required this.listCall, super.key});

  final List<SKY_CustomerCallCall> listCall;

  @override
  State<CalledView> createState() => _CalledViewState();
}

class _CalledViewState extends State<CalledView> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  String? currentUrl;

  @override
  void initState() {
    super.initState();

    // Lắng nghe sự thay đổi thời lượng và vị trí
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;  // Reset lại vị trí về 0
      });
    });
  }

  // Phát item mới và dừng item hiện tại nếu có
  Future<void> _playAudio(String url) async {
    if(currentUrl != null && currentUrl != url) {
      await _audioPlayer.stop(); // Dừng âm thanh hiện tại
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
      });
    }
    currentUrl = url;
    await _audioPlayer.play(UrlSource(url));
    setState(() {
      _isPlaying = true;
    });
  }

  // Tạm dừng âm thanh
  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  // Cập nhật vị trí phát khi kéo Slider
  void _seek(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if(widget.listCall[index].State == '6'){
          final bool isCurrentPlaying = currentUrl == widget.listCall[index].RecFilePathFull;
          final detailCall = widget.listCall[index];
          return InkWell(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.textWhiteColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (detailCall.CallType == '1') SvgPicture.asset(AppMediaRes.iconCallOut) else SvgPicture.asset(AppMediaRes.iconCallIn),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detailCall.CallType == '1' ? 'Cuộc gọi đi tới khách hàng ${detailCall.ToNumber}' : 'Cuộc gọi đến từ khách hàng  ${detailCall.FromNumber }',
                          style: AppTextStyles.textStyleInterW500S14Black,
                          // overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              'TG gọi:',
                              style: AppTextStyles.textStyleInterW400S12Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              child: Text(
                                detailCall.StartDTime,
                                style: AppTextStyles.textStyleInterW500S12Black,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if(currentUrl == detailCall.RecFilePathFull) {
                                  if(_isPlaying) {
                                    _pauseAudio();
                                  } else {
                                    _playAudio(detailCall.RecFilePathFull);
                                  }
                                } else {
                                  _playAudio(detailCall.RecFilePathFull);
                                }
                              },
                              child: Icon(
                                currentUrl == detailCall.RecFilePathFull ? _isPlaying ? Icons.pause : Icons.play_arrow : Icons.play_arrow,
                                size: 20,
                              ),
                            ),
                            Text(
                              isCurrentPlaying
                                  ? '${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')} / ${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}'
                                  : '0:00 / ${StringGenerate.convertDurationToStringWithoutHour(detailCall.TalkTime +1)}',
                            ),
                            Expanded(
                              child: Slider(
                                max: isCurrentPlaying
                                    ? _duration.inSeconds.toDouble()
                                    : 0, // Các item không phát sẽ có max là 0
                                value: isCurrentPlaying
                                    ? _position.inSeconds.toDouble()
                                    : 0, // Các item không phát sẽ có giá trị là 0
                                onChanged: isCurrentPlaying ? _seek : null,
                                activeColor: AppColors.primaryColor,
                              ),
                            ),
                            const Icon(Icons.volume_up, size: 20,),
                            const Icon(Icons.more_vert, size: 20,)
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Độ dài cuộc gọi:',
                              style: AppTextStyles.textStyleInterW400S12Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              child: Text(
                                StringGenerate.convertDurationToString(detailCall.TalkTime),
                                style: AppTextStyles.textStyleInterW500S12Black,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Agent tiếp nhận:',
                              style: AppTextStyles.textStyleInterW400S12Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              child: Text(
                                detailCall.suag_UserName,
                                style: AppTextStyles.textStyleInterW500S12Black,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Mã cuộc gọi:',
                              style: AppTextStyles.textStyleInterW400S12Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              child: Text(
                                detailCall.CallId,
                                style: AppTextStyles.textStyleInterW500S12Black,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else {
          final detailCall = widget.listCall[index];
          return InkWell(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.textWhiteColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (detailCall.CallType == '1') SvgPicture.asset(AppMediaRes.iconCallOutMiss) else SvgPicture.asset(AppMediaRes.iconCallInMiss),
                  const SizedBox(width: 8,),
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detailCall.CallType == '1' ? 'Cuộc gọi nhỡ đi tới khách hàng ${detailCall.ToNumber}' : 'Cuộc gọi nhỡ đến từ khách hàng  ${detailCall.FromNumber }',
                        style: AppTextStyles.textStyleInterW500S14Black,
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            'TG gọi:',
                            style: AppTextStyles.textStyleInterW400S12Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              detailCall.StartDTime,
                              style: AppTextStyles.textStyleInterW500S12Black,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Agent tiếp nhận:',
                            style: AppTextStyles.textStyleInterW400S12Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              detailCall.suag_UserName,
                              style: AppTextStyles.textStyleInterW500S12Black,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),)
                ],
              ),
            ),
          );
        }
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: AppColors.divideColor,
      ),
      itemCount: widget.listCall.length,
    );
  }
}
