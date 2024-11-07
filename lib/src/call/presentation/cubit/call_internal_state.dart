part of 'call_internal_cubit.dart';

enum CallInternalStatuses { loading, success, failure }

final class CallInternalState extends Equatable {
  const CallInternalState._({
    this.status = CallInternalStatuses.loading,
    this.agentList = const <Agent>[],
    this.keyword= '',
  });


  const CallInternalState.loading() : this._();

  const CallInternalState.success(List<Agent> items, String keyword)
      : this._(status: CallInternalStatuses.success, agentList: items, keyword: keyword);

  const CallInternalState.failure() : this._(status: CallInternalStatuses.failure);





  final CallInternalStatuses status;
  final List<Agent> agentList;
  final String keyword;

  @override
  // TODO: implement props
  List<Object?> get props => [status, agentList];

}
