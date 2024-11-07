import 'package:bloc/bloc.dart';
import 'package:ecore/core/modules/auth/domain/entities/session_info.dart';
import 'package:ecore/core/providers/call_provider.dart';
import 'package:meta/meta.dart';
import 'package:sip_ua/sip_ua.dart';

part 'call_register_state.dart';

class CallRegisterCubit extends Cubit<CallRegisterState> {
  CallRegisterCubit() : super(CallRegisterInitial());

  Future<void> register(SessionInfo sessionInfo, CallProvider provider) async {
    if (sessionInfo.callingInfo == null) {
      Future.delayed(Duration.zero, () {
        emit(CallRegisterError());
      });
      return;
    }
    (CallRegisterError());

    Future.delayed(Duration.zero, () async {
      await provider.register(sessionInfo);
      emit(CallRegisterSuccess());
    });
  }
}
