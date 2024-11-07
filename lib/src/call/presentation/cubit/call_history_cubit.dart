import 'package:bloc/bloc.dart';
import 'package:ecore/src/call/domain/entities/agent.dart';
import 'package:ecore/src/call/domain/usecases/get_agent_list.dart';
import 'package:ecore/src/call/domain/usecases/get_call_log.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/call_log.dart';

part 'call_history_state.dart';

class CallHistoryCubit extends Cubit<CallHistoryState> {
  CallHistoryCubit({required GetCallLog getCallLog})
      : _getCallLog = getCallLog,
        super(CallHistoryState.loading());

  final GetCallLog _getCallLog;

  Future<void> init() async {

    try {
      final result = await _getCallLog();
      result.fold((l){
        emit(const CallHistoryState.failure());

      }, (items){
        emit(CallHistoryState.success(items));
      });

    } on Exception {
      emit(const CallHistoryState.failure());
    }


  }



}
