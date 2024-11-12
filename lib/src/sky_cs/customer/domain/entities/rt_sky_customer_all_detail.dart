import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_biz_biz_all_order.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_call_call.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_cpn_campaign_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_et_ticket.dart';
import 'package:equatable/equatable.dart';


class RT_SKY_CustomerAllDetail extends Equatable {
  const RT_SKY_CustomerAllDetail({required this.Lst_Biz_BizAllOrder, required this.Lst_ET_Ticket, required this.Lst_Cpn_CampaignCustomer, required this.Lst_Call_Call});

  final List<SKY_CustomerBizBizAllOrder> Lst_Biz_BizAllOrder;
  final List<SKY_CustomerETTicket> Lst_ET_Ticket;
  final List<SKY_CustomerCpnCampaignCustomer> Lst_Cpn_CampaignCustomer;
  final List<SKY_CustomerCallCall> Lst_Call_Call;

  @override
  List<Object?> get props => [
    Lst_Biz_BizAllOrder,
    Lst_ET_Ticket,
    Lst_Cpn_CampaignCustomer,
    Lst_Call_Call,
  ];
}