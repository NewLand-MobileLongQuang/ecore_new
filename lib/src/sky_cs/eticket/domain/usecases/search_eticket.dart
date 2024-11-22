import 'package:equatable/equatable.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/typedef.dart';
import '../entities/sky_eticket_info.dart';
import '../repos/sky_eticket_repo.dart';

class SearchETicketSkyCSParams extends Equatable {
  final String FlagOutOfDate;
  final String FlagNotRespondingSLA;
  final String DepartmentCode;
  final String AgentCode;
  final String TicketStatus;
  final String TicketPriority;
  final String TicketDeadlineFrom;
  final String TicketDeadlineTo;
  final String TicketType;
  final String CustomerCodeSys;
  final String TicketDetail;
  final String TicketName;
  final String TicketID;
  final String CreateDTimeUTCFrom;
  final String CreateDTimeUTCTo;
  final String LUDTimeUTCFrom;
  final String LUDTimeUTCTo;
  final String TicketSource;
  final String OrgID;
  final String CustomerCompany;
  final String Follower;
  final String TicketCustomType;
  final String Description;
  final String CreateBy;
  final String FlagTicketDeadlineDTime;
  final String TicketPhoneNo;
  final String FlagGetOtherOrgID;
  final String FlagGetOtherDepartment;
  final String Ft_PageIndex;
  final String Ft_PageSize;


  SearchETicketSkyCSParams({
    required this.FlagOutOfDate,
    required this.FlagNotRespondingSLA,
    required this.DepartmentCode,
    required this.AgentCode,
    required this.TicketStatus,
    required this.TicketPriority,
    required this.TicketDeadlineFrom,
    required this.TicketDeadlineTo,
    required this.TicketType,
    required this.CustomerCodeSys,
    required this.TicketDetail,
    required this.TicketName,
    required this.TicketID,
    required this.CreateDTimeUTCFrom,
    required this.CreateDTimeUTCTo,
    required this.LUDTimeUTCFrom,
    required this.LUDTimeUTCTo,
    required this.TicketSource,
    required this.OrgID,
    required this.CustomerCompany,
    required this.Follower,
    required this.TicketCustomType,
    required this.Description,
    required this.CreateBy,
    required this.FlagTicketDeadlineDTime,
    required this.TicketPhoneNo,
    required this.FlagGetOtherOrgID,
    required this.FlagGetOtherDepartment,
    required this.Ft_PageIndex,
    required this.Ft_PageSize,
  });

  @override
  List<Object> get props => [FlagOutOfDate, FlagNotRespondingSLA, DepartmentCode, AgentCode, TicketStatus, TicketPriority, TicketDeadlineFrom, TicketDeadlineTo, TicketType, CustomerCodeSys, TicketDetail, TicketName, TicketID, CreateDTimeUTCFrom, CreateDTimeUTCTo, LUDTimeUTCFrom, LUDTimeUTCTo, TicketSource, OrgID, CustomerCompany, Follower, TicketCustomType, Description, CreateBy, FlagTicketDeadlineDTime, TicketPhoneNo, FlagGetOtherOrgID, FlagGetOtherDepartment, Ft_PageIndex, Ft_PageSize];
}

class SearchETicketSkyCSUseCase extends UsecaseWithParams<List<SKY_TicketInfo>, SearchETicketSkyCSParams> {
  SearchETicketSkyCSUseCase(this._repository);
  final SKY_EticketRepository _repository;

  @override
  ResultFuture<List<SKY_TicketInfo>> call(SearchETicketSkyCSParams params) async {
    return await _repository.searchETicket(params: params);
  }
}
