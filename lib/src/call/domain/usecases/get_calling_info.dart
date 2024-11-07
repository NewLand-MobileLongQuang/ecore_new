import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/calling_info.dart';
import '../repos/call_repo.dart';




class GetCallingInfo extends UsecaseWithoutParams<CallingInfo>
{
  const GetCallingInfo(this._repo);
  final CallRepo _repo;


  
  @override
  ResultFuture<CallingInfo> call() async => _repo.getCallingInfo();
}