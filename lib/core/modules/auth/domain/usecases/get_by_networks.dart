import 'package:equatable/equatable.dart';

import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/object_result.dart';
import '../repos/entry_center_gate_repo.dart';

class GetByNetworksParams extends Equatable{
  const GetByNetworksParams({required this.solutionCode, required this.networkId});

  final String networkId;
  final String solutionCode;

  @override
  List<Object?> get props => [networkId];
}

class GetByNetworks extends UsecaseWithParams<List<ObjectResult>, GetByNetworksParams> {
  GetByNetworks(this._repo);
  final EntryCenterGateRepo _repo;

  @override
  ResultFuture<List<ObjectResult>> call(GetByNetworksParams params) {
    return _repo.getByNetworks(solutionCode: params.solutionCode, networkId: params.networkId);
  }

}