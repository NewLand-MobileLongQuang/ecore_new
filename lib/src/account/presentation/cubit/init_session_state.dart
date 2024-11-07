part of 'init_session_cubit.dart';

@immutable
sealed class InitSessionState {}

final class InitSessionInitial extends InitSessionState {}

final class InitSessionLogin extends InitSessionState {}

final class InitSessionSelectNetwork extends InitSessionState {}

final class InitSessionInitCall extends InitSessionState {}

final class InitSessionSaveSession extends InitSessionState {
  InitSessionSaveSession({required this.sessionInfo});

  final SessionInfo sessionInfo;



}
final class InitSessionOk extends InitSessionState {}
