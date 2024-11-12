import 'package:bloc/bloc.dart';
import 'package:ecore/core/configs/app_config.dart';
import 'package:ecore/core/modules/auth/domain/entities/session_info.dart';
import 'package:ecore/core/modules/auth/domain/usecases/get_by_networks.dart';
import 'package:ecore/core/services/injection/injection_container.dart';
import 'package:ecore/src/sky_cs/common/utils.dart';
import 'package:meta/meta.dart';

part 'sky_cs_state.dart';

class SkyCsCubit extends Cubit<SkyCsState> {
  SkyCsCubit() : super(SkyCsInitial());

  Future<void> init() async {
    emit(SkyCsLoading());
    var ss = SessionInfo.current();
    if (ss.org == null) {
      emit(SkyCsError(message: 'No Org Data'));
      return;
    }
    try {
      final test = await sl<GetByNetworks>()(GetByNetworksParams(solutionCode: SkyCsUtils.getSolution().code, networkId: ss.org!.getNetworkId().toString()));
      //TEST client service
      final baseUrl = test.fold((l) => '', (r) => r[0].WSUrlAddr);
      SessionInfo.setCacheData(SkyCsUtils.getApiUrlKey(), baseUrl);
      emit(SkyCsLoaded());
    } catch (e) {
      emit(SkyCsError(message: e.toString()));
    }
  }
}
