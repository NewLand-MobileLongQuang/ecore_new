import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/call_log.dart';

import '../repos/call_repo.dart';




class GetCallLog extends UsecaseWithoutParams<List<CallLog>>
{
  const GetCallLog(this._repo);
  final CallRepo _repo;


  
  @override
  ResultFuture<List<CallLog>> call() async => _repo.getCallLog();
}