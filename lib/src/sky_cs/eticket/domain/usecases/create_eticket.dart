import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/typedef.dart';
import '../repos/sky_eticket_repo.dart';


class CreateETicketSkyCSParams extends Equatable {
  const CreateETicketSkyCSParams({required this.strJson,});

  final String strJson;

  @override
  List<Object?> get props => [strJson];

  Map<String, dynamic> toMap() {
    return {
      'strJson': strJson,
    };
  }
}

class CreateETicketSkyCSUseCase extends UsecaseWithParams<String, CreateETicketSkyCSParams> {
  CreateETicketSkyCSUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<String> call(CreateETicketSkyCSParams params) async {
    return await _repository.createETicketSkyCS(params: params);
  }
}