import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/typedef.dart';
import '../../domain/entities/sky_eticket_getticketID.dart';
import '../../domain/entities/sky_eticket_info.dart';
import '../../domain/repos/sky_eticket_repo.dart';
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
import '../models/sky_eticket_groupcreate_model.dart';
import '../models/sky_ticketID_model.dart';


class SKY_EticketRepositoryImpl implements SKY_EticketRepository {
  SKY_EticketRepositoryImpl(this._dataSource);
  final SKY_eTicketDataSource _dataSource;

  @override
  ResultFuture<String> createETicketSkyCS({required CreateETicketSkyCSParams params}) async {
    try {
      final result = await _dataSource.createETicketSkyCS(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_TicketInfo>> searchETicket({required SearchETicketSkyCSParams params}) async {
    try {
      final result = await _dataSource.searchETicket(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SKY_GetTicketID> searchTicketIDGroup({required SearchTicketIDGroupParams params}) async {
    try {
      final result = await _dataSource.getGetByTicketID(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SKY_ETicketTplCodesysModel> getByETGetByETScrTplCodeSys(
      {required GetByEticketCodeSysParams params}) async {
    try {
      final result = await _dataSource.getGetByETScrTplCodeSys(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SKY_EticketGroupModel>> getETGroup() async {
    try {
      final result = await _dataSource.getETGroup();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }@override
  ResultFuture<SKY_ETicketMstTagsModel> getETMstTags() async {
    try {
      final result = await _dataSource.getETMstTags();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }@override
  ResultFuture<SKY_ETicket_Lst_Mst_Orgs_Model> getETMstOrg() async {
    try {
      final result = await _dataSource.getETMstOrg();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }@override
  ResultFuture<SKY_ETicket_Lst_Priority_Model> getETTicketPriority() async {
    try {
      final result = await _dataSource.getETTicketPriority();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
  @override
  ResultFuture<SKY_ETicket_Lst_TicketSource_Model> getETTicketSource() async {
    try {
      final result = await _dataSource.getETTicketSource();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
  @override
  ResultFuture<SKY_ETicket_Lst_Status_Model> getETTicketStatus() async {
    try {
      final result = await _dataSource.getETTicketStatus();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SKY_ETicket_Lst_ReceptionChannel_Model> getETReceptionChannel() async {
    try {
      final result = await _dataSource.getETReceptionChannel();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SKY_ETicket_Lst_Agent_Model> getLstAgent({required GetAgentbydepartParams params}) async {
    try {
      final result = await _dataSource.getAgentByDepartmentCode(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SKY_ETicket_Lst_Department_Model> getlstDepartment(
      {required GetdepartmentParams params}) async {
    try {
      final result = await _dataSource.getETDepartment(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SKY_ETicket_Lst_Type_Model> getETicketType() async {
    try {
      final result = await _dataSource.getETTicketType();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SKY_ETicket_Lst_CustomType_Model> getETCustomType() async {
    try {
      final result = await _dataSource.getETCustomType();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<String> mergeETicketSkyCS({required MergeETicketSkyCSParams params}) async {
    try {
      final result = await _dataSource.MergeETicket(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
  @override
  ResultFuture<String> splitETicketSkyCS({required SplitETicketSkyCSParams params}) async {
    try {
      final result = await _dataSource.SplitETicket(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
