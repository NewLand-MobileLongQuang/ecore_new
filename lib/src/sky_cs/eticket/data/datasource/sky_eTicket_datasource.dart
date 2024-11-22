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

abstract class SKY_CustomerDataSource {
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
  Future<String> createeTicketSkyCS({required CreateCustomerSkyCSParams params});
  Future<String> MergeETicket({required MergeETicketSkyCSParams params});
  Future<String> SplitETicket({required SplitETicketSkyCSParams params});
}

class SKY_eTicketRemoteDataSource extends SkyCsSvDataSource {
  SKY_eTicketRemoteDataSource(super.client);
  // manage

  Future<SKY_ETicketTplCodesysModel> getGetByETScrTplCodeSys({required GetByEticketCodeSysParams params}) async {
    final paramsInit = {
      'ETScrTplCodeSys': params.ETScrTplCodeSys,
      'OrgID': params.OrgID,
    };
    try {
      final response = await postGetByETScrTplCodeSys(
        path: '/ETMetaScreenTemplate/GetByETScrTplCodeSys',
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

  Future<List<SKY_EticketGroupModel>> getETGroup() async {

    try {
      final response = await postSearchGroupET(
        path: '/ETMetaScreenTemplate/GetAllActive',
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

  Future<SKY_ETicketGetIDModel> getGetByTicketID({required SearchTicketIDGroupParams params}) async {
    final paramsInit = {
      'TicketID': params.TicketID,
    };
    try {
      final response = await postGetByTicketID(
        path: 'ETTicket/GetByTicketID',
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

  Future<String> createETicketSkyCS({required CreateETicketSkyCSParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postCreateETicketSkyCS(
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
    final paramsInit = {
      'FlagOutOfDate': params.FlagOutOfDate,
      'FlagNotRespondingSLA': params.FlagNotRespondingSLA,
      'DepartmentCode': params.DepartmentCode,
      'AgentCode': params.AgentCode,
      'TicketStatus': params.TicketStatus,
      'TicketPriority': params.TicketPriority,
      'TicketDeadlineFrom': params.TicketDeadlineFrom,
      'TicketDeadlineTo': params.TicketDeadlineTo,
      'TicketType': params.TicketType,
      'CustomerCodeSys': params.CustomerCodeSys,
      'TicketDetail': params.TicketDetail,
      'TicketName': params.TicketName,
      'TicketID': params.TicketID,
      'CreateDTimeUTCFrom': params.CreateDTimeUTCFrom,
      'CreateDTimeUTCTo': params.CreateDTimeUTCTo,
      'LUDTimeUTCFrom': params.LUDTimeUTCFrom,
      'LUDTimeUTCTo': params.LUDTimeUTCTo,
      'TicketSource': params.TicketSource,
      'OrgID': params.OrgID,
      'CustomerCompany': params.CustomerCompany,
      'Follower': params.Follower,
      'TicketCustomType': params.TicketCustomType,
      'Description': params.Description,
      'CreateBy': params.CreateBy,
      'FlagTicketDeadlineDTime': params.FlagTicketDeadlineDTime,
      'TicketPhoneNo': params.TicketPhoneNo,
      'FlagGetOtherOrgID': params.FlagGetOtherOrgID,
      'FlagGetOtherDepartment': params.FlagGetOtherDepartment,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postSearchETicket(
        path: 'ETTicket/Search',
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

  Future<SKY_ETicketMstTagsModel> getETMstTags() async {

    try {
      final response = await postGetByMstTags(
        path: '/MstTag/GetAllActive',
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

  Future<SKY_ETicket_Lst_Mst_Orgs_Model> getETMstOrg() async {

    try {
      final response = await postGetByMstOrg(
        path: '/MstOrg/GetAllActive',
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

  Future<SKY_ETicket_Lst_CustomType_Model> getETCustomType() async {

    try {
      final response = await postGetCustomType(
        path: '/MstTicketCustomType/GetAllActive',
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

  Future<SKY_ETicket_Lst_Priority_Model> getETTicketPriority() async {

    try {
      final response = await postGetByTicketPriority(
        path: '/MstTicketPriority/GetAllActive',
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

  Future<SKY_ETicket_Lst_TicketSource_Model> getETTicketSource() async {

    try {
      final response = await postGetByTicketSource(
        path: '/MstTicketSource/GetAllActive',
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

  Future<SKY_ETicket_Lst_Status_Model> getETTicketStatus() async {

    try {
      final response = await postGetByTicketStatus(
        path: '/MstTicketStatus/GetAllActive',
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

  Future<SKY_ETicket_Lst_ReceptionChannel_Model> getETReceptionChannel() async {

    try {
      final response = await postGetByReceptionChannel(
        path: '/MstReceptionChannel/GetAllActive',
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

  Future<SKY_ETicket_Lst_Type_Model> getETTicketType() async {

    try {
      final response = await postGetTicketType(
        path: '/MstTicketType/GetAllActive',
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

  Future<SKY_ETicket_Lst_Department_Model> getETDepartment({required GetdepartmentParams params}) async {
    final paramsInit = {
      'OrgID': params.OrgID,
    };
    try {
      final response = await postgetDepartment(
        path: '/MstDepartment/GetByOrgID',
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

  Future<SKY_ETicket_Lst_Agent_Model> getAgentByDepartmentCode({required GetAgentbydepartParams params}) async {
    final paramsInit = {
      'DepartmentCode': params.DepartmentCode,
      'OrgID': params.OrgID,
    };
    try {
      final response = await postGetAgentByDepartmentCode(
        path: '/MstDepartment/GetAgentByDepartmentCode',
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

  Future<String> createeTicketSkyCS({required CreateCustomerSkyCSParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
      'strJsonZaloUserFollower': params.strJsonZaloUserFollower,
      'strJsonEmail': params.strJsonEmail,
      'strJsonPhone': params.strJsonPhone,
      'strJsonCtmGroup': params.strJsonCtmGroup,
      'strJsonCtmPartnerType': params.strJsonCtmPartnerType,
      'strJsonUserManager': params.strJsonUserManager,
      'strJsonGovID': params.strJsonGovID,
      'ScrTplCodeSys': params.ScrTplCodeSys,
    };
    try {
      final response = await postCreateCustomerSkyCS(
        path: 'MstCustomer/Create',
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

  Future<String> MergeETicket({required MergeETicketSkyCSParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postMergeETicket(
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
    final paramsInit = {
      'strJson': params.strJson,
    };
    try {
      final response = await postSplitETicket(
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