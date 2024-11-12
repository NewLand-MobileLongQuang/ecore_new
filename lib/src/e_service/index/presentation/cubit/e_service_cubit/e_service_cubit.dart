import 'package:bloc/bloc.dart';
import 'package:ecore/src/e_service/common/utils.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/modules/auth/domain/entities/session_info.dart';
import '../../../../../../core/modules/auth/domain/usecases/get_by_networks.dart';
import '../../../../../../core/services/injection/injection_container.dart';

part 'e_service_state.dart';

class EServiceCubit extends Cubit<EServiceState> {
  EServiceCubit() : super(EServiceInitial());

  Future<void> init() async {
    emit(EServiceLoading());
    var ss = SessionInfo.current();
    if (ss.org == null) {
      emit(EServiceError(message: 'No Org Data'));
      return;
    }
    try {
      final test = await sl<GetByNetworks>()(GetByNetworksParams(solutionCode: EServiceUtils.getSolution().code, networkId: ss.org!.getNetworkId().toString()));
      //TEST client service
      final baseUrl = test.fold((l) => '', (r) => r[0].WSUrlAddr);
      SessionInfo.setCacheData(EServiceUtils.getApiUrlKey(), baseUrl);
      emit(EServiceLoaded());
    } catch (e) {
      emit(EServiceError(message: e.toString()));
    }
  }
}
