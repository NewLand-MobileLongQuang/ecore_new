import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_detail_state.dart';

class ChangeDetailCubit extends Cubit<ChangeDetailState> {
  ChangeDetailCubit() : super(ChangeDetailInitial());
}
