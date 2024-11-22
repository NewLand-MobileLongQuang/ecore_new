import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/typedef.dart';
import '../repos/sky_eticket_repo.dart';

class MergeETicketSkyCSParams extends Equatable {
  const MergeETicketSkyCSParams({required this.strJson,});


  final String strJson;

  @override
  List<Object?> get props => [strJson];

  Map<String, dynamic> toMap() {
    return {
      'strJson': strJson,
    };
  }
}
  class MergeETicketSkyCSUseCase extends UsecaseWithParams<String, MergeETicketSkyCSParams> {
    MergeETicketSkyCSUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<String> call(MergeETicketSkyCSParams params) async {
  return await _repository.mergeETicketSkyCS(params: params);
  }
  }
