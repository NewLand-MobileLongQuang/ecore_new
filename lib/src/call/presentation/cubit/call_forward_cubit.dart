import 'package:bloc/bloc.dart';
import 'package:ecore/src/call/domain/usecases/redirect_current_call.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/agent.dart';
import '../../domain/usecases/get_agent_list.dart';

part 'call_forward_state.dart';

class CallForwardCubit extends Cubit<CallForwardState> {
  CallForwardCubit(
      {required GetAgentList getAgentList,
      required RedirectCurrentCall redirectCurrentCall})
      : _getAgentList = getAgentList,
        _redirectCurrentCall = redirectCurrentCall,
        super(CallForwardState.loading());

  final GetAgentList _getAgentList;
  final RedirectCurrentCall _redirectCurrentCall;

  Future<void> init() async {
    try {
      final result = await _getAgentList();
      result.fold((l) {
        emit(const CallForwardState.failure());
      }, (items) {
        emit(CallForwardState.success(items, ''));
      });
    } on Exception {
      emit(const CallForwardState.failure());
    }
  }

  Future<void> input(String keyword) async {
    emit(CallForwardState.success(state.agentList, keyword));
  }

  Future<void> forwardCall(String target) async {
    _redirectCurrentCall(target);
    //emit(CallForwardState.success(state.agentList, keyword));
  }
}
