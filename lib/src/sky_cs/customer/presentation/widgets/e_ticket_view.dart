import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_et_ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ETicketView extends StatefulWidget {
  const ETicketView({required this.listTicket, super.key});

  final List<SKY_CustomerETTicket> listTicket;

  @override
  State<ETicketView> createState() => _ETicketViewState();
}

class _ETicketViewState extends State<ETicketView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
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
                SvgPicture.asset(AppMediaRes.iconRedTicket,),
                const SizedBox(width: 8,),
                Expanded(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.listTicket[index].TicketName,
                      style: AppTextStyles.textStyleInterW500S14Black,
                      // overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'TG tạo:',
                          style: AppTextStyles.textStyleInterW400S12Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            widget.listTicket[index].CreateDTimeUTC,
                            style: AppTextStyles.textStyleInterW500S12Black,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Deadline:',
                          style: AppTextStyles.textStyleInterW400S12Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            widget.listTicket[index].TicketDeadline,
                            style: AppTextStyles.textStyleInterW500S12Black,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Agent phụ trách:',
                          style: AppTextStyles.textStyleInterW400S12Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            widget.listTicket[index].AgentName,
                            style: AppTextStyles.textStyleInterW500S12Black,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Trạng thái:',
                          style: AppTextStyles.textStyleInterW400S12Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            widget.listTicket[index].TicketStatus,
                            style: AppTextStyles.textStyleInterW500S12Green,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'TG xử lý:',
                          style: AppTextStyles.textStyleInterW400S12Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            widget.listTicket[index].ProcessTime,
                            style: AppTextStyles.textStyleInterW500S12Black,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
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
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: AppColors.divideColor,
      ),
      itemCount: widget.listTicket.length,
    );
  }
}
