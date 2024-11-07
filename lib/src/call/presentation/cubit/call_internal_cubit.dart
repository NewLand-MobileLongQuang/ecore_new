import 'package:bloc/bloc.dart';
import 'package:ecore/src/call/domain/entities/agent.dart';
import 'package:ecore/src/call/domain/usecases/get_agent_list.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'call_internal_state.dart';

class CallInternalCubit extends Cubit<CallInternalState> {
  CallInternalCubit({required GetAgentList getAgentList})
      : _getAgentList = getAgentList,
        super(CallInternalState.loading());

  final GetAgentList _getAgentList;

  Future<void> init() async {

    try {
      final result = await _getAgentList();
      result.fold((l){
        emit(const CallInternalState.failure());

      }, (items){
        emit(CallInternalState.success(items, ''));
      });

    } on Exception {
      emit(const CallInternalState.failure());
    }


  }

  Future<void> input(String keyword) async {
    emit(CallInternalState.success(state.agentList, keyword));
  }


}
