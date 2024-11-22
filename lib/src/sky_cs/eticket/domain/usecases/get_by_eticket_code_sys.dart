import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/typedef.dart';
import '../../data/models/sky_ticketID_model.dart';
import '../repos/sky_eticket_repo.dart';

class GetByEticketCodeSysParams extends Equatable {
  const GetByEticketCodeSysParams({required this.ETScrTplCodeSys, required this.OrgID});

  final String ETScrTplCodeSys;
  final String OrgID;

  @override
  List<Object?> get props => [ETScrTplCodeSys, OrgID];

  Map<String, dynamic> toMap() {
    return {
      'ETScrTplCodeSys': ETScrTplCodeSys,
      'OrgID': OrgID,
    };
  }
}

class GetByEticketCodeSysUseCase extends UsecaseWithParams<SKY_ETicketTplCodesysModel, GetByEticketCodeSysParams> {
  GetByEticketCodeSysUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicketTplCodesysModel> call(GetByEticketCodeSysParams params) async {
    return await _repository.getByETGetByETScrTplCodeSys(params: params);
  }
}