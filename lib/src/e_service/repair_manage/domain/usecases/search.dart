import 'package:equatable/equatable.dart';
import 'package:ecore/core/usecases/usecase.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:ecore/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class SearchROParams extends Equatable {
  const SearchROParams({required this.RONo, required this.ProductCode, required this.CustomerPhoneNo, required this.CustomerAddress, required this.AgentCode, required this.InstallationDTimeUTCFrom, required this.InstallationDTimeUTCTo, required this.WarrantyDTimeUTCFrom, required this.WarrantyDTimeUTCTo, required this.WarrantyExpDTimeUTCFrom, required this.WarrantyExpDTimeUTCTo, required this.Remark, required this.OrgID, required this.SerialNo, required this.Ft_PageIndex, required this.Ft_PageSize});

  final String RONo;
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
  final String SerialNo;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  @override
  List<Object?> get props => [
    RONo,
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
    SerialNo,
    Ft_PageIndex,
    Ft_PageSize,
  ];
}

class SearchROUseCase extends UsecaseWithParams<List<ES_RODetail>, SearchROParams> {
  SearchROUseCase(this._repository);
  final ES_RORepository _repository;

  @override
  ResultFuture<List<ES_RODetail>> call(SearchROParams params) async {
    return await _repository.search(params: params);
  }
}