import 'package:equatable/equatable.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer_detail.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer_email.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer_phone.dart';

class RT_ESCustomerDetail extends Equatable {
  const RT_ESCustomerDetail({required this.Lst_Mst_Customer, required this.Lst_Mst_CustomerEmail, required this.Lst_Mst_CustomerPhone});

  final List<ESCustomerDetail> Lst_Mst_Customer;
  final List<ESCustomerEmail> Lst_Mst_CustomerEmail;
  final List<ESCustomerPhone> Lst_Mst_CustomerPhone;

  @override
  List<Object?> get props => [Lst_Mst_Customer, Lst_Mst_CustomerEmail, Lst_Mst_CustomerPhone];
}
