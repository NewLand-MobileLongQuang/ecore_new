
import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/agent.dart';
import '../repos/call_repo.dart';




class GetAgentList extends UsecaseWithoutParams<List<Agent>>
{
  const GetAgentList(this._repo);
  final CallRepo _repo;


  
  @override
  ResultFuture<List<Agent>> call() async => _repo.getAgentList();
}