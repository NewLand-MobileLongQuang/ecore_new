import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/res/colors.dart';
import '../../../../../core/res/media_res.dart';
import '../../../../../core/res/text_styles.dart';
import '../../domain/entities/sky_eticket_get_attachfile.dart';


class FiledocView extends StatefulWidget {
  const FiledocView({super.key,required this.ETATFile});

  final List<SKY_TicketAttachFile> ETATFile;

  @override
  State<FiledocView> createState() => _FiledocViewState();
}

class _FiledocViewState extends State<FiledocView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height, // Specify the height
      child: ListView.separated(
        itemCount: widget.ETATFile.length,
        separatorBuilder: (context, index) =>
            Container(height: 1, color: AppColors.divideColor),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.textWhiteColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(AppMediaRes.iconCallOut,),
                  ],
                ),
                const SizedBox(width: 3,),
                Expanded(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.ETATFile[index].FileName,
                      style: AppTextStyles.textStyleInterW500S14Black,
                      maxLines: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.ETATFile[index].FileType,
                          style: AppTextStyles.textStyleInterW400S12Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(child: Container(),),
                        Text(
                          widget.ETATFile[index].UploadBy,
                          style: AppTextStyles.textStyleInterW500S12Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Dung lượng: ${widget.ETATFile[index].FileSize.toString()}KB',
                          style: AppTextStyles.textStyleInterW400S12Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(child: Container(),),
                        Text(
                          widget.ETATFile[index].UploadDTimeUTC,
                          style: AppTextStyles.textStyleInterW500S12Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),)
              ],
            ),
          );
        },
      ),
    );
  }
}
