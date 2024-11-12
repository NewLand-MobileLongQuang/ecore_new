import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_type.dart';
import 'package:equatable/equatable.dart';


class RT_SKY_CustomerType extends Equatable {
  RT_SKY_CustomerType({required this.Lst_Mst_CustomerType});

  final List<SKY_CustomerType> Lst_Mst_CustomerType;


  @override
  List<Object?> get props => [Lst_Mst_CustomerType];

}