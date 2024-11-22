import 'package:equatable/equatable.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/typedef.dart';
import '../entities/sky_eticket_getticketID.dart';
import '../repos/sky_eticket_repo.dart';

class SearchTicketIDGroupParams extends Equatable {
  const SearchTicketIDGroupParams({
    required this.TicketID,
  });

  final String TicketID;

  @override
  List<Object?> get props => [
    TicketID,
  ];
}

class SearchTicketIDGroupUseCase extends UsecaseWithParams<SKY_GetTicketID, SearchTicketIDGroupParams> {
  SearchTicketIDGroupUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_GetTicketID> call(SearchTicketIDGroupParams params) async {
    return await _repository.searchTicketIDGroup(params: params);
  }
}