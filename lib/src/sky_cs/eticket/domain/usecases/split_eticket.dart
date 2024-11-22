import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/typedef.dart';
import '../repos/sky_eticket_repo.dart';

class SplitETicketSkyCSParams extends Equatable {
  const SplitETicketSkyCSParams({required this.strJson,});


  final String strJson;

  @override
  List<Object?> get props => [strJson];
}
class SplitETicketSkyCSUseCase extends UsecaseWithParams<String, SplitETicketSkyCSParams> {
  SplitETicketSkyCSUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<String> call(SplitETicketSkyCSParams params) async {
    return await _repository.splitETicketSkyCS(params: params);
  }
}
