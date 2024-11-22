import 'package:equatable/equatable.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/typedef.dart';
import '../../data/models/sky_eticket_groupcreate_model.dart';
import '../repos/sky_eticket_repo.dart';

class SearchTicketTplGroup extends Equatable {
  const SearchTicketTplGroup();

  @override
  List<Object?> get props => [
  ];
}

class SearchTicketTplGroupUseCase extends UsecaseWithoutParams<List<SKY_EticketGroupModel>> {
  SearchTicketTplGroupUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<List<SKY_EticketGroupModel>> call() async {
    return await _repository.getETGroup();
  }
}

