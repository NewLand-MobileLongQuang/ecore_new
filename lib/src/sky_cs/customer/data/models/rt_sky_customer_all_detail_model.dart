import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_biz_biz_all_order_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_call_call_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_cpn_campaign_customer_model.dart';
import 'package:ecore/src/sky_cs/customer/data/models/sky_customer_et_ticket_model.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rt_sky_customer_all_detail.dart';

class RT_SKY_CustomerAllDetailModel extends RT_SKY_CustomerAllDetail {
  const RT_SKY_CustomerAllDetailModel({required super.Lst_Biz_BizAllOrder, required super.Lst_ET_Ticket, required super.Lst_Cpn_CampaignCustomer, required super.Lst_Call_Call});

  factory RT_SKY_CustomerAllDetailModel.fromMap(Map<String, dynamic> json) {
    return RT_SKY_CustomerAllDetailModel(
      Lst_Biz_BizAllOrder: json['Lst_Biz_BizAllOrder'] != null
          ? (json['Lst_Biz_BizAllOrder'] as List).map((item) => SKY_CustomerBizBizAllOrderModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_CustomerBizBizAllOrderModel>[],
      Lst_ET_Ticket: json['Lst_ET_Ticket'] != null
          ? (json['Lst_ET_Ticket'] as List).map((item) => SKY_CustomerETTicketModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_CustomerETTicketModel>[],
      Lst_Cpn_CampaignCustomer: json['Lst_Cpn_CampaignCustomer'] != null
          ? (json['Lst_Cpn_CampaignCustomer'] as List).map((item) => SKY_CustomerCpnCampaignCustomerModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_CustomerCpnCampaignCustomerModel>[],
      Lst_Call_Call: json['Lst_Call_Call'] != null
          ? (json['Lst_Call_Call'] as List).map((item) => SKY_CustomerCallCallModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_CustomerCallCallModel>[],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Lst_Biz_BizAllOrder': Lst_Biz_BizAllOrder,
      'Lst_ET_Ticket': Lst_ET_Ticket,
      'Lst_Cpn_CampaignCustomer': Lst_Cpn_CampaignCustomer,
      'Lst_Call_Call': Lst_Call_Call,
    };
  }
}