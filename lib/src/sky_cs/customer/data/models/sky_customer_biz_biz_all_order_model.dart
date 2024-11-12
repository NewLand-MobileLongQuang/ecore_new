import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_biz_biz_all_order.dart';

class SKY_CustomerBizBizAllOrderModel extends SKY_CustomerBizBizAllOrder {
  const SKY_CustomerBizBizAllOrderModel({required super.Idx, required super.BizCodeSys, required super.BizType, required super.CreateDTimeUTC, required super.CreateDTime});

  factory SKY_CustomerBizBizAllOrderModel.fromJson(Map<String, dynamic> json) {
    return SKY_CustomerBizBizAllOrderModel(
      Idx: json['Idx'] as int? ?? 0,
      BizCodeSys: json['BizCodeSys'] as String? ?? '',
      BizType: json['BizType'] as String? ?? '',
      CreateDTimeUTC: json['CreateDTimeUTC'] as String? ?? '',
      CreateDTime: json['CreateDTime'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Idx': Idx,
      'BizCodeSys': BizCodeSys,
      'BizType': BizType,
      'CreateDTimeUTC': CreateDTimeUTC,
      'CreateDTime': CreateDTime,
    };
  }
}