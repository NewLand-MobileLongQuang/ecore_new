import '../../../../../core/utils/typedef.dart';
import '../../data/models/sky_eticket_get_lst_agent_model.dart';
import '../../data/models/sky_eticket_get_lst_customtype_model.dart';
import '../../data/models/sky_eticket_get_lst_department_model.dart';
import '../../data/models/sky_eticket_get_lst_mst_Org_model.dart';
import '../../data/models/sky_eticket_get_lst_priority_model.dart';
import '../../data/models/sky_eticket_get_lst_receptionchannel_model.dart';
import '../../data/models/sky_eticket_get_lst_status_model.dart';
import '../../data/models/sky_eticket_get_lst_ticket_type_model.dart';
import '../../data/models/sky_eticket_get_lst_ticketsource_model.dart';
import '../../data/models/sky_eticket_get_mst_tags_model.dart';
import '../../data/models/sky_eticket_groupcreate_model.dart';
import '../../data/models/sky_ticketID_model.dart';
import '../entities/sky_eticket_getticketID.dart';
import '../entities/sky_eticket_info.dart';
import '../usecases/create_eticket.dart';
import '../usecases/get_by_eticket_code_sys.dart';
import '../usecases/get_by_eticket_create_masterdata.dart';
import '../usecases/merge_eticket.dart';
import '../usecases/search_eticket.dart';
import '../usecases/search_ticketID_group.dart';
import '../usecases/split_eticket.dart';

abstract class SKY_EticketRepository {
  // create
  ResultFuture<SKY_ETicketTplCodesysModel> getByETGetByETScrTplCodeSys({required GetByEticketCodeSysParams params});
  ResultFuture<List<SKY_EticketGroupModel>> getETGroup();
  ResultFuture<SKY_ETicketMstTagsModel> getETMstTags();
  ResultFuture<SKY_ETicket_Lst_Mst_Orgs_Model> getETMstOrg();
  ResultFuture<SKY_ETicket_Lst_Priority_Model> getETTicketPriority();
  ResultFuture<SKY_ETicket_Lst_TicketSource_Model> getETTicketSource();
  ResultFuture<SKY_ETicket_Lst_Status_Model> getETTicketStatus();
  ResultFuture<SKY_ETicket_Lst_ReceptionChannel_Model> getETReceptionChannel();
  ResultFuture<SKY_ETicket_Lst_Type_Model> getETicketType();
  ResultFuture<SKY_ETicket_Lst_CustomType_Model> getETCustomType();
  ResultFuture<SKY_GetTicketID> searchTicketIDGroup({required SearchTicketIDGroupParams params});
  ResultFuture<SKY_ETicket_Lst_Department_Model> getlstDepartment({required GetdepartmentParams params});
  ResultFuture<SKY_ETicket_Lst_Agent_Model> getLstAgent({required GetAgentbydepartParams params});
  ResultFuture<String> createETicketSkyCS({required CreateETicketSkyCSParams params});

  ResultFuture<String> mergeETicketSkyCS({required MergeETicketSkyCSParams params});
  ResultFuture<String> splitETicketSkyCS({required SplitETicketSkyCSParams params});

  // manage
  ResultFuture<List<SKY_TicketInfo>> searchETicket({required SearchETicketSkyCSParams params});

}