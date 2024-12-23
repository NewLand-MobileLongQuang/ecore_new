import '../../../../../core/errors/exceptions.dart';
import '../../../common/datasource/sky_cs_datasource.dart';
import '../../../customer/domain/usecases/create_customer.dart';
import '../../domain/usecases/create_eticket.dart';
import '../../domain/usecases/get_by_eticket_code_sys.dart';
import '../../domain/usecases/get_by_eticket_create_masterdata.dart';
import '../../domain/usecases/merge_eticket.dart';
import '../../domain/usecases/search_eticket.dart';
import '../../domain/usecases/search_ticketID_group.dart';
import '../../domain/usecases/split_eticket.dart';
import '../models/sky_eticket_get_lst_agent_model.dart';
import '../models/sky_eticket_get_lst_customtype_model.dart';
import '../models/sky_eticket_get_lst_department_model.dart';
import '../models/sky_eticket_get_lst_mst_Org_model.dart';
import '../models/sky_eticket_get_lst_priority_model.dart';
import '../models/sky_eticket_get_lst_receptionchannel_model.dart';
import '../models/sky_eticket_get_lst_status_model.dart';
import '../models/sky_eticket_get_lst_ticket_type_model.dart';
import '../models/sky_eticket_get_lst_ticketsource_model.dart';
import '../models/sky_eticket_get_mst_tags_model.dart';
import '../models/sky_eticket_getticket_ID.dart';
import '../models/sky_eticket_groupcreate_model.dart';
import '../models/sky_eticket_info_search_model.dart';
import '../models/sky_ticketID_model.dart';

abstract class SKY_EticketDataSource {
  Future<SKY_ETicketTplCodesysModel> getGetByETScrTplCodeSys({required GetByEticketCodeSysParams params});
  Future<List<SKY_EticketGroupModel>> getETGroup();
  Future<SKY_ETicketGetIDModel> getGetByTicketID({required SearchTicketIDGroupParams params});
  Future<String> createETicketSkyCS({required CreateETicketSkyCSParams params});
  Future<List<SKY_ETicketInfo_Model>> searchETicket({required SearchETicketSkyCSParams params});
  Future<SKY_ETicketMstTagsModel> getETMstTags();
  Future<SKY_ETicket_Lst_Mst_Orgs_Model> getETMstOrg();
  Future<SKY_ETicket_Lst_CustomType_Model> getETCustomType();
  Future<SKY_ETicket_Lst_Priority_Model> getETTicketPriority();
  Future<SKY_ETicket_Lst_TicketSource_Model> getETTicketSource();
  Future<SKY_ETicket_Lst_Status_Model> getETTicketStatus();
  Future<SKY_ETicket_Lst_ReceptionChannel_Model> getETReceptionChannel();
  Future<SKY_ETicket_Lst_Type_Model> getETTicketType();
  Future<SKY_ETicket_Lst_Department_Model> getETDepartment({required GetdepartmentParams params});
  Future<SKY_ETicket_Lst_Agent_Model> getAgentByDepartmentCode({required GetAgentbydepartParams params});
  Future<String> MergeETicket({required MergeETicketSkyCSParams params});
  Future<String> SplitETicket({required SplitETicketSkyCSParams params});
}

class SKY_eTicketRemoteDataSource extends SkyCsSvDataSource implements SKY_EticketDataSource {
  SKY_eTicketRemoteDataSource(super.client);
  // manage

  Future<SKY_ETicketTplCodesysModel> getGetByETScrTplCodeSys({required GetByEticketCodeSysParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
        path: '/ETMetaScreenTemplate/GetByETScrTplCodeSys',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;
      SKY_ETicketTplCodesysModel res = SKY_ETicketTplCodesysModel.fromJson(data);

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<SKY_EticketGroupModel>> getETGroup() async {

    try {
      final response = await post(
        path: '/ETMetaScreenTemplate/GetAllActive',
      );
      final dataList = response['Data'] as dynamic;
      List<SKY_EticketGroupModel> res =
      dataList.map<SKY_EticketGroupModel>((i) => SKY_EticketGroupModel.fromJson(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicketGetIDModel> getGetByTicketID({required SearchTicketIDGroupParams params}) async {

    final paramsInit =params.toMap();

    try {
      final response = await post(
        path: 'ETTicket/GetByTicketID',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;
      SKY_ETicketGetIDModel res = SKY_ETicketGetIDModel.fromJson(data);

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<String> createETicketSkyCS({required CreateETicketSkyCSParams params}) async {

    final paramsInit = params.toMap();

    try {
      final response = await post(
        path: '/ETTicket/Create',
        params: paramsInit,
      );
      return response;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<List<SKY_ETicketInfo_Model>> searchETicket({required SearchETicketSkyCSParams params}) async {

    final paramsInit = params.toMap();

    try {
      final response = await post(
        path: 'ETTicket/Search',
        params: paramsInit,
      );

      final dataList = response['DataList'] as List;
      List<SKY_ETicketInfo_Model> res =
      dataList.map<SKY_ETicketInfo_Model>((i) => SKY_ETicketInfo_Model.fromJson(i)).toList();

      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicketMstTagsModel> getETMstTags() async {

    try {
      final response = await post(
        path: '/MstTag/GetAllActive',
      );
      final data = response['Data'] as dynamic;
      SKY_ETicketMstTagsModel res = SKY_ETicketMstTagsModel.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_Mst_Orgs_Model> getETMstOrg() async {

    try {
      final response = await post(
        path: '/MstOrg/GetAllActive',
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_Mst_Orgs_Model res = SKY_ETicket_Lst_Mst_Orgs_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_CustomType_Model> getETCustomType() async {

    try {
      final response = await post(
        path: '/MstTicketCustomType/GetAllActive',
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_CustomType_Model res = SKY_ETicket_Lst_CustomType_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_Priority_Model> getETTicketPriority() async {

    try {
      final response = await post(
        path: '/MstTicketPriority/GetAllActive',
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_Priority_Model res = SKY_ETicket_Lst_Priority_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_TicketSource_Model> getETTicketSource() async {

    try {
      final response = await post(
        path: '/MstTicketSource/GetAllActive',
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_TicketSource_Model res = SKY_ETicket_Lst_TicketSource_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_Status_Model> getETTicketStatus() async {

    try {
      final response = await post(
        path: '/MstTicketStatus/GetAllActive',
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_Status_Model res = SKY_ETicket_Lst_Status_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_ReceptionChannel_Model> getETReceptionChannel() async {

    try {
      final response = await post(
        path: '/MstReceptionChannel/GetAllActive',
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_ReceptionChannel_Model res = SKY_ETicket_Lst_ReceptionChannel_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_Type_Model> getETTicketType() async {

    try {
      final response = await post(
        path: '/MstTicketType/GetAllActive',
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_Type_Model res = SKY_ETicket_Lst_Type_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_Department_Model> getETDepartment({required GetdepartmentParams params}) async {

    final paramsInit = params.toMap();

    try {
      final response = await post(
        path: '/MstDepartment/GetByOrgID',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_Department_Model res = SKY_ETicket_Lst_Department_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<SKY_ETicket_Lst_Agent_Model> getAgentByDepartmentCode({required GetAgentbydepartParams params}) async {

    final paramsInit = params.toMap();

    try {
      final response = await post(
        path: '/MstDepartment/GetAgentByDepartmentCode',
        params: paramsInit,
      );
      final data = response['Data'] as dynamic;
      SKY_ETicket_Lst_Agent_Model res = SKY_ETicket_Lst_Agent_Model.fromJson(data);
      return res;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }


  Future<String> MergeETicket({required MergeETicketSkyCSParams params}) async {
    final paramsInit = params.toMap();
    try {
      final response = await post(
        path: 'ETTicket/Merge',
        params: paramsInit,
      );
      return response.strErrCode;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  Future<String> SplitETicket({required SplitETicketSkyCSParams params}) async {

    final paramsInit = params.toMap();

    try {
      final response = await post(
        path: 'ETTicket/Split',
        params: paramsInit,
      );
      return response.strErrCode;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }
}