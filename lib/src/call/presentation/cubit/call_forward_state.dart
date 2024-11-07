part of 'call_forward_cubit.dart';

enum CallForwardStatuses { loading, success, failure }

final class CallForwardState extends Equatable {
  const CallForwardState._({
    this.status = CallForwardStatuses.loading,
    this.agentList = const <Agent>[],
    this.keyword = '',
  });

  const CallForwardState.loading() : this._();

  const CallForwardState.success(List<Agent> items, String keyword)
      : this._(
            status: CallForwardStatuses.success,
            agentList: items,
            keyword: keyword);

  const CallForwardState.failure()
      : this._(status: CallForwardStatuses.failure);

  final CallForwardStatuses status;
  final List<Agent> agentList;
  final String keyword;

  @override
  // TODO: implement props
  List<Object?> get props => [status, agentList];
}
