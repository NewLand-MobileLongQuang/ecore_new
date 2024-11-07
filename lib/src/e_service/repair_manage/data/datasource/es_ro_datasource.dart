
import '../../../../../core/errors/exceptions.dart';
import '../../../common/datasource/e_service_datasource.dart';
import '../../domain/usecases/delete.dart';
import '../../domain/usecases/finish.dart';
import '../../domain/usecases/get_by_ro_no.dart';
import '../../domain/usecases/search.dart';
import '../../domain/usecases/search_error_component.dart';
import '../../domain/usecases/search_error_type.dart';
import '../../domain/usecases/search_product.dart';
import '../../domain/usecases/update.dart';
import '../model/es_ro_detail_model.dart';
import '../model/es_ro_error_type_model.dart';
import '../model/es_ro_product_model.dart';
import '../model/rt_es_ro_detail_model.dart';
import '../model/rt_es_ro_error_component_model.dart';

class ES_RODataSource extends EServiceSvDataSource {
  ES_RODataSource(super.client);

  Future<List<ES_RODetailModel>> search({required SearchROParams params}) async {
      final paramsInit = {
        'SerialNo': params.SerialNo,
        'ProductCode': params.ProductCode,
        'CustomerPhoneNo': params.CustomerPhoneNo,
        'CustomerAddress': params.CustomerAddress,
        'AgentCode': params.AgentCode,
        'InstallationDTimeUTCFrom': params.InstallationDTimeUTCFrom,
        'InstallationDTimeUTCTo': params.InstallationDTimeUTCTo,
        'WarrantyDTimeUTCFrom': params.WarrantyDTimeUTCFrom,
        'WarrantyDTimeUTCTo': params.WarrantyDTimeUTCTo,
        'WarrantyExpDTimeUTCFrom': params.WarrantyExpDTimeUTCFrom,
        'WarrantyExpDTimeUTCTo': params.WarrantyExpDTimeUTCTo,
        'Remark': params.Remark,
        'OrgID': params.OrgID,
        'Ft_PageIndex': params.Ft_PageIndex,
        'Ft_PageSize': params.Ft_PageSize,
      };
      try {
        final response = await postSearchRO(
          path: 'ESRO/Search',
          params: paramsInit,
        );
        return response.objResult!;
      }
      on ApiException {
        rethrow;
      }
      on Exception catch (ex) {
        throw ApiException(Message: ex.toString());
      }
    }

  Future<RT_ES_RODetailModel> getByRONo({required GetByRONoParams params}) async {
    final paramsInit = {
      'RONo': params.RONo,
    };
    try {
      final response = await postGetByRONo(
        path: 'ESRO/GetByRONo',
        params: paramsInit,
      );
      return response.objResult!;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<void> update({required UpdateROParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postChange(
        path: 'ESRO/Update',
        params: paramsInit,
      );
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<void> delete({required DeleteROParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postChange(
        path: 'ESRO/Delete',
        params: paramsInit,
      );
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<ES_ROErrorTypeModel>> searchErrorType({required SearchErrorTypeParams params}) async {
    try {
      final response = await postSearchErrorType(
        path: 'MstErrorType/GetAllActive',
      );
      return response.objResult!;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<ES_ROProductModel>> searchProduct({required SearchProductParams params}) async {
    final paramsInit = {
      'ProductCodeUser': params.ProductCodeUser,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postSearchProduct(
        params: paramsInit,
        path: 'MstProduct/Search',
      );
      return response.objResult!;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<RT_ES_ROErrorComponentModel> searchErrorComponent({required SearchErrorComponentParams params}) async {
    final paramsInit = {
      'ProductGrpCode': params.ProductGrpCode,
      'OrgID': params.OrgID,
    };
    try {
      final response = await postSearchErrorComponent(
        params: paramsInit,
        path: 'MstErrorComponent/GetByProductGrpCode',
      );
      return response.objResult!;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<void> finish({required FinishROParams params}) async {
    final paramsInit = {
      'RONo': params.RONo,
      'FinishDTimeUser': params.FinishDTimeUser,
    };
    try {
      final response = await postChange(
        path: 'ESRO/Finish',
        params: paramsInit,
      );
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }
}