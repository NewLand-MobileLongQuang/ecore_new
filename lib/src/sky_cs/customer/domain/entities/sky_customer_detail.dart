import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_info.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_phone.dart';
import 'package:equatable/equatable.dart';

class SKY_CustomerDetail extends Equatable {
  SKY_CustomerDetail({required this.Lst_Mst_Customer, required this.Lst_Mst_CustomerPhone});

  final List<SKY_CustomerInfo> Lst_Mst_Customer;
  final List<SKY_CustomerPhone> Lst_Mst_CustomerPhone;

  @override
  List<Object?> get props => [Lst_Mst_Customer, Lst_Mst_CustomerPhone];
}