import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

class SearchWarrantyParams extends Equatable {
  const SearchWarrantyParams({
    required this.SerialNo,
    required this.ProductCode,
    required this.CustomerPhoneNo,
    required this.CustomerAddress,
    required this.AgentCode,
    required this.InstallationDTimeUTCFrom,
    required this.InstallationDTimeUTCTo,
    required this.WarrantyDTimeUTCFrom,
    required this.WarrantyDTimeUTCTo,
    required this.WarrantyExpDTimeUTCFrom,
    required this.WarrantyExpDTimeUTCTo,
    required this.Remark,
    required this.OrgID,
    required this.Ft_PageIndex,
    required this.Ft_PageSize,
  });

  final String SerialNo;
  final String ProductCode;
  final String CustomerPhoneNo;
  final String CustomerAddress;
  final String AgentCode;
  final String InstallationDTimeUTCFrom;
  final String InstallationDTimeUTCTo;
  final String WarrantyDTimeUTCFrom;
  final String WarrantyDTimeUTCTo;
  final String WarrantyExpDTimeUTCFrom;
  final String WarrantyExpDTimeUTCTo;
  final String Remark;
  final String OrgID;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  @override
  List<Object?> get props => [
    SerialNo,
    ProductCode,
    CustomerPhoneNo,
    CustomerAddress,
    AgentCode,
    InstallationDTimeUTCFrom,
    InstallationDTimeUTCTo,
    WarrantyDTimeUTCFrom,
    WarrantyDTimeUTCTo,
    WarrantyExpDTimeUTCFrom,
    WarrantyExpDTimeUTCTo,
    Remark,
    OrgID,
    Ft_PageIndex,
    Ft_PageSize,
  ];

}

class SearchWarrantyUseCase extends UsecaseWithParams<List<ES_WarrantyDetail>, SearchWarrantyParams> {
  SearchWarrantyUseCase(this._repository);
  final ES_WarrantyRepository _repository;

  @override
  ResultFuture<List<ES_WarrantyDetail>> call(SearchWarrantyParams params) async {
    return await _repository.search(params: params);
  }
}