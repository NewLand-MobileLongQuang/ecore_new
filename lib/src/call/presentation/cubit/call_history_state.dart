part of 'call_history_cubit.dart';

enum CallHisrotyStatuses { loading, success, failure }

final class CallHistoryState extends Equatable{

  const CallHistoryState._({
    this.status = CallHisrotyStatuses.loading,
    this.dataList = const <CallLog>[],

  });

  const CallHistoryState.loading() : this._();

  const CallHistoryState.success(List<CallLog> items)
      : this._(status: CallHisrotyStatuses.success, dataList: items);

  const CallHistoryState.failure() : this._(status: CallHisrotyStatuses.failure);





  final CallHisrotyStatuses status;
  final List<CallLog> dataList;


  @override
  // TODO: implement props
  List<Object?> get props => [status, dataList];
}
