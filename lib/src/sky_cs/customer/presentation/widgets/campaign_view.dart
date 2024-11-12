import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/media_res.dart';
import 'package:ecore/core/res/text_styles.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_cpn_campaign_customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CampaignView extends StatefulWidget {
  const CampaignView({required this.listCampaign, super.key});

  final List<SKY_CustomerCpnCampaignCustomer> listCampaign;

  @override
  State<CampaignView> createState() => _CampaignViewState();
}

class _CampaignViewState extends State<CampaignView> {
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
                SvgPicture.asset(AppMediaRes.iconBlueCampaign,),
                const SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.listCampaign[index].CampaignName,
                        style: AppTextStyles.textStyleInterW500S14Black,
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            'TT chiến dịch:',
                            style: AppTextStyles.textStyleInterW400S12Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              widget.listCampaign[index].CampaignStatus,
                              style: AppTextStyles.textStyleInterW500S12Blue,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'TT thực hiện:',
                            style: AppTextStyles.textStyleInterW400S12Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              widget.listCampaign[index].CampaignCustomerStatus,
                              style: AppTextStyles.textStyleInterW500S12Blue,
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
                              widget.listCampaign[index].AgentCode,
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
                            'TG thực hiện:',
                            style: AppTextStyles.textStyleInterW400S12Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              widget.listCampaign[index].LogLUDTimeUTC,
                              style: AppTextStyles.textStyleInterW500S12Black,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Loại chiến dịch',
                            style: AppTextStyles.textStyleInterW400S12Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              widget.listCampaign[index].CampaignTypeName,
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
      itemCount: widget.listCampaign.length,
    );
  }
}
