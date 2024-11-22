import 'package:equatable/equatable.dart';
import '../../../../../core/usecases/usecase.dart';
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
import '../repos/sky_eticket_repo.dart';

class GetMstTagsUseCase extends UsecaseWithoutParams<SKY_ETicketMstTagsModel> {
  GetMstTagsUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicketMstTagsModel> call() async {
    return await _repository.getETMstTags();
  }
}

class GetMstOrgUseCase extends UsecaseWithoutParams<SKY_ETicket_Lst_Mst_Orgs_Model> {
  GetMstOrgUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_Mst_Orgs_Model> call() async {
    return await _repository.getETMstOrg();
  }
}

class GetTicketPriorityUseCase extends UsecaseWithoutParams<SKY_ETicket_Lst_Priority_Model> {
  GetTicketPriorityUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_Priority_Model> call() async {
    return await _repository.getETTicketPriority();
  }
}

class GetTicketSourceUseCase extends UsecaseWithoutParams<SKY_ETicket_Lst_TicketSource_Model> {
  GetTicketSourceUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_TicketSource_Model> call() async {
    return await _repository.getETTicketSource();
  }
}
class GetTicketStatusUseCase extends UsecaseWithoutParams<SKY_ETicket_Lst_Status_Model> {
  GetTicketStatusUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_Status_Model> call() async {
    return await _repository.getETTicketStatus();
  }
}
class GetReceptionChannelUseCase extends UsecaseWithoutParams<SKY_ETicket_Lst_ReceptionChannel_Model> {
  GetReceptionChannelUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_ReceptionChannel_Model> call() async {
    return await _repository.getETReceptionChannel();
  }
}
class GetTicketTypeUseCase extends UsecaseWithoutParams<SKY_ETicket_Lst_Type_Model> {
  GetTicketTypeUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_Type_Model> call() async {
    return await _repository.getETicketType();
  }
}
class GetCustomTypeUseCase extends UsecaseWithoutParams<SKY_ETicket_Lst_CustomType_Model> {
  GetCustomTypeUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_CustomType_Model> call() async {
    return await _repository.getETCustomType();
  }
}

class GetAgentbydepartParams extends Equatable {
  const GetAgentbydepartParams({
    required this.DepartmentCode,
    required this.OrgID,
  });

  final String DepartmentCode;
  final String OrgID;

  @override
  List<Object?> get props => [
    DepartmentCode,
    OrgID,
  ];

  Map<String, dynamic> toMap() {
    return {
      'DepartmentCode': DepartmentCode,
      'OrgID': OrgID,
    };
  }
}

class GetdepartmentParams extends Equatable {
  const GetdepartmentParams({
    required this.OrgID,
  });

  final String OrgID;

  @override
  List<Object?> get props => [
    OrgID,
  ];

  Map<String, dynamic> toMap() {
    return {
      'OrgID': OrgID,
    };
  }
}

class GetLstDepartmentUseCase extends UsecaseWithParams<SKY_ETicket_Lst_Department_Model, GetdepartmentParams> {
  GetLstDepartmentUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_Department_Model> call(GetdepartmentParams params) async {
    return await _repository.getlstDepartment(params: params);
  }
}

class GetAgentUseCase extends UsecaseWithParams<SKY_ETicket_Lst_Agent_Model, GetAgentbydepartParams> {
  GetAgentUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<SKY_ETicket_Lst_Agent_Model> call(GetAgentbydepartParams params) async {
    return await _repository.getLstAgent(params: params);
  }
}
