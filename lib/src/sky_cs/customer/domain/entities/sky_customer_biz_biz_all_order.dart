import 'package:equatable/equatable.dart';

class SKY_CustomerBizBizAllOrder extends Equatable {
  const SKY_CustomerBizBizAllOrder({required this.Idx, required this.BizCodeSys, required this.BizType, required this.CreateDTimeUTC, required this.CreateDTime});

  final int Idx;
  final String BizCodeSys;
  final String BizType;
  final String CreateDTimeUTC;
  final String CreateDTime;

  @override
  List<Object?> get props => [
    Idx,
    BizCodeSys,
    BizType,
    CreateDTimeUTC,
    CreateDTime,
  ];
}
