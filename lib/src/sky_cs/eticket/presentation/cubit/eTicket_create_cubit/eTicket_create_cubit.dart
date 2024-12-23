import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../customer/domain/entities/sky_customer_info.dart';
import '../../../../customer/domain/usecases/search_customer.dart';
import '../../../data/models/rq_sky_eticket_follower_model.dart';
import '../../../data/models/rq_sky_eticket_lst_model.dart';
import '../../../data/models/rq_sky_eticket_model.dart';
import '../../../data/models/sky_eticket_column_model.dart';
import '../../../data/models/sky_eticket_get_lst_customtype_model.dart';
import '../../../data/models/sky_eticket_get_lst_department_model.dart';
import '../../../data/models/sky_eticket_get_lst_mst_Org_model.dart';
import '../../../data/models/sky_eticket_get_lst_priority_model.dart';
import '../../../data/models/sky_eticket_get_lst_receptionchannel_model.dart';
import '../../../data/models/sky_eticket_get_lst_status_model.dart';
import '../../../data/models/sky_eticket_get_lst_ticket_type_model.dart';
import '../../../data/models/sky_eticket_get_lst_ticketsource_model.dart';
import '../../../data/models/sky_eticket_get_mst_tags_model.dart';
import '../../../data/models/sky_eticket_groupcreate_model.dart';
import '../../../data/models/sky_ticketID_model.dart';
import '../../../domain/entities/sky_eticket_get_agent.dart';
import '../../../domain/usecases/create_eticket.dart';
import '../../../domain/usecases/get_by_eticket_code_sys.dart';
import '../../../domain/usecases/get_by_eticket_create_masterdata.dart';
import '../../../domain/usecases/search_eticket_grouptpl.dart';

part 'eTicket_create_state.dart';

class eTicketCreateCubit extends Cubit<eTicketCreateState> {
  eTicketCreateCubit({
    required GetByEticketCodeSysUseCase getByETGetByETScrTplCodeSys,
    required SearchTicketTplGroupUseCase getETtpl,
    required GetMstTagsUseCase getETMstTags,
    required GetMstOrgUseCase getETMstOrgUseCase,
    required GetTicketPriorityUseCase getETTicketPriority,
    required GetTicketSourceUseCase getETTicketSource,
    required GetTicketStatusUseCase getETTicketStatus,
    required GetReceptionChannelUseCase getETReceptionChannel,
    required GetLstDepartmentUseCase getETLstDepartment,
    required GetAgentUseCase getETAgent,
    required GetTicketTypeUseCase getETicketType,
    required GetCustomTypeUseCase getETCustomType,
    required CreateETicketSkyCSUseCase createETicketSkyCSUseCase,
    required SearchCustomerSkyCSUseCase searchCustomerSkyCSUseCase,

    })
      : _getByETGetByETScrTplCodeSys = getByETGetByETScrTplCodeSys,
        _getETtpl = getETtpl,
        _getETMstTags = getETMstTags,
        _getETMstOrgUseCase = getETMstOrgUseCase,
        _getETTicketPriority = getETTicketPriority,
        _getETTicketSource = getETTicketSource,
        _getETTicketStatus = getETTicketStatus,
        _getETReceptionChannel = getETReceptionChannel,
        _getETLstDepartment = getETLstDepartment,
        _getETAgent = getETAgent,
        _getETicketType = getETicketType,
        _getECustomType = getETCustomType,
        _createETicketSkyCSUseCase = createETicketSkyCSUseCase,
        _searchCustomerSkyCSUseCase = searchCustomerSkyCSUseCase,
        super(eTicketCreateInitial());

  final GetByEticketCodeSysUseCase _getByETGetByETScrTplCodeSys;
  final SearchTicketTplGroupUseCase _getETtpl;
  final GetMstTagsUseCase _getETMstTags;
  final GetMstOrgUseCase _getETMstOrgUseCase;
  final GetTicketPriorityUseCase _getETTicketPriority;
  final GetTicketSourceUseCase _getETTicketSource;
  final GetTicketStatusUseCase _getETTicketStatus;
  final GetReceptionChannelUseCase _getETReceptionChannel;
  final GetLstDepartmentUseCase _getETLstDepartment;
  final GetAgentUseCase _getETAgent;
  final GetTicketTypeUseCase _getETicketType;
  final GetCustomTypeUseCase _getECustomType;
  final CreateETicketSkyCSUseCase _createETicketSkyCSUseCase;
  final SearchCustomerSkyCSUseCase _searchCustomerSkyCSUseCase;

  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String> _controllersdynamic = {};
  late String customerCode = '';
  late String customerName = '';
  late String customerType = '';
  late String deadline = '';
  late String ticketName = '';
  late String ticketstatus = '';
  late String ticketdetail = '';
  late String ticketdepartment = '';
  late String tickettype = '';
  late String ticketphoneno = '';
  late String ticketpriority = '';
  late String ticketcustomtype = '';
  late String ticketsource = '';
  late String ticketreception = '';
  late String ticketcontact = '';
  late String tickettag = '';
  late String ticketremindWork = '';
  late String ticketOrg = '';

  Map<String, TextEditingController> get controllers => _controllers;
  List<bool> isCheckNull = [];
  int pageIndex = 0;
  static const int pageSize = 10;

  Future<void> init() async {
    emit(eTicketCreateLoading());
    try {
      final result = await _getByETGetByETScrTplCodeSys.call(
          const GetByEticketCodeSysParams(
              ETScrTplCodeSys: 'ETSCRTPLCODESYS.DEFAULT',
              OrgID: '7206207001'
          ),
      );
      final gettemtpl = result.fold((l) => null, (r) => r)!;

      final getalltpl = await _getETtpl.call();
      final resultETAlltemplateFold = getalltpl.fold((l) => null, (r) => r)!;

      final getMstTags = await _getETMstTags.call();
      final resultETMstTagsFold = getMstTags.fold((l) => null, (r) => r)!;
      tickettag=resultETMstTagsFold.Lst_Mst_Tag[0].TagID;

      final getOrg = await _getETMstOrgUseCase.call();
      final resultETOrgFold = getOrg.fold((l) => null, (r) => r)!;
      ticketOrg = '7206207001';

      final getTicketPriority = await _getETTicketPriority.call();
      final resultETTicketPriorityFold = getTicketPriority.fold((l) => null, (r) => r)!;
      ticketpriority =resultETTicketPriorityFold.Lst_Mst_Priority[0].TicketPriority;

      final getTicketSource = await _getETTicketSource.call();
      final resultETicketSourceFold = getTicketSource.fold((l) => null, (r) => r)!;
      ticketsource =resultETicketSourceFold.Lst_Mst_TicketSource[0].TicketSource;

      final getTicketStatus = await _getETTicketStatus.call();
      final resultETTicketStatusFold = getTicketStatus.fold((l) => null, (r) => r)!;
      ticketstatus =resultETTicketStatusFold.Lst_Mst_TicketStatus[0].TicketStatus;

      final getReceptionChannel = await _getETReceptionChannel.call();
      final resultETReceptionChannelFold = getReceptionChannel.fold((l) => null, (r) => r)!;
      ticketreception =resultETReceptionChannelFold.Lst_Mst_ReceptionChannel[0].ReceptionChannel;

      final getTicketType = await _getETicketType.call();
      final resultETicketTypeFold = getTicketType.fold((l) => null, (r) => r)!;
      tickettype = resultETicketTypeFold.Lst_Mst_TicketType[0].TicketType;

      final getCustomType = await _getECustomType.call();
      final resultETCustomTypeFold = getCustomType.fold((l) => null, (r) => r)!;
      ticketcustomtype =resultETCustomTypeFold.Lst_Mst_TicketCustomType[0].TicketCustomType;

      final getdepartment = await _getETLstDepartment.call(
        const GetdepartmentParams(
           OrgID: '7206207001'
        ),
      );
      final resultETDepartmentFold = getdepartment.fold((l) => null, (r) => r)!;
      ticketdepartment = resultETDepartmentFold.Lst_Mst_Department[0].DepartmentCode;

      final listCustomer = await _searchCustomerSkyCSUseCase(
        SearchCustomerSkyCSParams(
          ScrTplCodeSys: 'SCRTPLCODESYS.2023',
          KeyWord: '',
          FlagActive: '1',
          Ft_PageIndex: pageIndex.toString(),
          Ft_PageSize: pageSize.toString(),
        ),
      );
      final listcusFold = listCustomer.fold((l) => l, (r) => r) as List<SKY_CustomerInfo>;
      customerCode = listcusFold[0].CustomerCode;

      gettemtpl.Lst_ET_MetaColGroupSpec.add(
          SKY_ETicket_Column_Model(
              OrgID: '7206207001',
              ETScrTplCodeSys: 'ETSCRTPLCODESYS.DEFAULT',
              TicketColGrpCode: 'TAOMOILEFT',
              TicketColCfgCodeSys: 'CusCode',
              NetworkID: '7206207001',
              ColOperatorType: 'EQUAL',
              OrderIdx: 1,
              ColWidth: 1,
              JsonRenderParams: '',
              JsonListOption: '',
              FlagIsNotNull: '1',
              FlagIsCheckDuplicate: '0',
              FlagIsQuery: '1',
              LogLUDTimeUTC: '',
              LogLUBy: '',
              ColCode: 'CusCode',
              ColCaption: 'Khách hàng',
              ColDataType: 'MASTERDATA',
              FlagIsColDynamic: '0'
          )
      );
      for (var col in gettemtpl.Lst_ET_MetaColGroupSpec) {
          _controllers[col.ColCode]= TextEditingController();
      }

      emit(eTicketCreateStateLoaded(
        gettemtpl: gettemtpl,
        listETAlltemplateFold: resultETAlltemplateFold,
        listETMstTagsFold: resultETMstTagsFold,
        listETOrgFold: resultETOrgFold,
        listETTicketPriorityFold: resultETTicketPriorityFold,
        listETTicketSourceFold: resultETicketSourceFold,
        listETTicketStatusFold: resultETTicketStatusFold,
        listETReceptionChannelFold: resultETReceptionChannelFold,
        listETicketTypeFold: resultETicketTypeFold,
        listETCustomTypeFold: resultETCustomTypeFold,
        listETDepartmentFold: resultETDepartmentFold,
        listETcusFold: listcusFold,
      ));
    } on Exception catch (e) {
      emit(eTicketCreateStateError(e.toString()));
    }
  }

  Future<List<SKY_ETicket_Agent>> getListAgentOption(String departcode) async {
    try {
      final getdepartment = await _getETAgent.call(
        GetAgentbydepartParams(
          DepartmentCode: departcode,
          OrgID: '7206207001',
        ),
      );
      final resultETDepartmentFold = getdepartment.fold((l) => null, (r) => r)!;
      print("departcode ${getdepartment}");
      // final listOption = await _getETAgent.call(
      //   GetAgentbydepartParams(
      //     DepartmentCode: departcode,
      //     OrgID: '7206207001',
      //   ),
      // );
      log("CHECK chạy tiếp");

      return resultETDepartmentFold.Sys_UserAutoAssignTicket;
    } catch (e) {
      throw Exception('Failed to fetch options: $e');
    }
  }

  Future<void> save() async {
    emit(eTicketCreateLoading());
    final List<Map<String, String>> eticketInfoList = [];

    controllers.forEach((key, controller) {
    print("CHECK $key     CONTROLLER ${controller.text}");
    if(controller.text.isNotEmpty) {
      switch (key) {
          case 'TicketDeadline':
            deadline = controller.text;
            break;
          case 'CustomerName':
            customerName = controller.text;
            break;
          case 'TicketName':
            ticketName = controller.text;
            break;
          case 'TicketStatus':
              ticketstatus = controller.text;
            break;
          case 'TicketDetail':
            ticketdetail = controller.text;
            break;
          case 'DepartmentCode':
            ticketdepartment = controller.text;
            break;
          case 'TicketType':
            tickettype = controller.text;
            break;
          case 'TicketPhoneNo':
            ticketphoneno = controller.text;
            break;
          case 'TicketPriority':
            ticketpriority = controller.text;
            break;
          case 'TicketCustomType':
            ticketcustomtype = controller.text;
            break;
          case 'TicketSource':
            ticketsource = controller.text;
            break;
          case 'ReceptionChannel':
            ticketreception = controller.text;
            break;
          case 'ContactChannel':
            ticketcontact = controller.text;
            break;
          case 'Tags':
            tickettag = controller.text;
            break;
          case 'RemindWork':
            ticketremindWork = controller.text;
            break;
        }
    }
    });

    final test = RQ_SKY_eTicketModel(
      ETScrTplCodeSys: 'ETSCRTPLCODESYS.DEFAULT',
      TicketStatus: ticketstatus,
      OrgID: ticketOrg,
      CustomerCodeSys: customerCode,
      TicketName: ticketName,
      TicketDetail: ticketdetail,
      AgentCode: "mainto:normal01@igoss.vn",
      DepartmentCode: ticketdepartment,
      TicketType: tickettype,
      TicketPhoneNo: ticketphoneno,
      TicketDeadline: deadline,
      TicketPriority: ticketpriority,
      TicketJsonInfo: jsonEncode(eticketInfoList),
      ReceptionDTimeUTC: '2024-11-15 16:00:00',
      TicketCustomType: ticketcustomtype,
      TicketSource: ticketsource,
      ReceptionChannel: ticketreception,
      ContactChannel: ticketcontact,
      Tags: tickettag,
      RemindWork: ticketremindWork,
    );
    print("CHECK Test ${test}");

    final test1 = RQ_SKY_eTicketModel(
      ETScrTplCodeSys: 'ETSCRTPLCODESYS.DEFAULT',
      TicketStatus: 'OPEN',
      OrgID: '7206207001',
      CustomerCodeSys: 'KHE2R99344',
      TicketName: 'TESTT TK0204',
      TicketDetail: 'TEST tạo ticket',
      AgentCode: 'mainto:normal01@igoss.vn',
      DepartmentCode: 'TEST123',
      TicketType: 'DEFAULT',
      TicketPhoneNo: '032154678941',
      TicketDeadline: '2024-11-16 9:00:00',
      TicketPriority: 'NORMAL',
      TicketJsonInfo: jsonEncode(eticketInfoList),
      ReceptionDTimeUTC: '2024-11-15 16:00:00',
      TicketCustomType: "",
      TicketSource: "",
      ReceptionChannel: "",
      ContactChannel: "",
      Tags: "",
      RemindWork: "",
    );
    final jsontest =
    RQ_SKY_eTicket_lst_Model(
        ET_Ticket: test1,
        Lst_ET_TicketAttachFile: [],
        Lst_ET_TicketFollower: [
          RQ_SKY_eTicket_follower_Model(
              AgentCode: "NORMAL@IGOSS.VN",
              FollowType: ""
          )
        ]);
    print("CHECK JSON EST ${jsonEncode(jsontest.toJson())}");

    final result = await _createETicketSkyCSUseCase.call(
      CreateETicketSkyCSParams(
        strJson: jsonEncode(jsontest.toJson()),
      ),
    );
    print("CHECK create $result");
    emit(eTicketCreateStateSuccess());
  }

  void validateAndSave1(BuildContext context) {
    save();
  }

  void validateAndSave(BuildContext context) {
    final currentState = state;
    if (currentState is eTicketCreateStateLoaded) {
      final List<String> missingFields = [];

      controllers.forEach((key, controller) {
        final col = currentState.gettemtpl.Lst_ET_MetaColGroupSpec.firstWhere(
              (element) => element.ColCode == key,
        );

        if (key=="TicketName"&&controller.text.isEmpty) {
          missingFields.add(col.ColCaption);
        }
        if (key=="TicketDetail"&&controller.text.isEmpty) {
          missingFields.add(col.ColCaption);
        }

      });

      if (missingFields.isNotEmpty) {
        final errorMessage = 'Các trường sau không được để trống:\n' + missingFields.join('\n');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
        emit(
          eTicketCreateStateLoaded(
            gettemtpl: currentState.gettemtpl,
            listETAlltemplateFold: currentState.listETAlltemplateFold,
            listETMstTagsFold: currentState.listETMstTagsFold,
            listETOrgFold: currentState.listETOrgFold,
            listETTicketPriorityFold: currentState.listETTicketPriorityFold,
            listETTicketSourceFold: currentState.listETTicketSourceFold,
            listETTicketStatusFold: currentState.listETTicketStatusFold,
            listETReceptionChannelFold: currentState.listETReceptionChannelFold,
            listETicketTypeFold: currentState.listETicketTypeFold,
            listETCustomTypeFold: currentState.listETCustomTypeFold,
            listETDepartmentFold: currentState.listETDepartmentFold,
            listETcusFold: currentState.listETcusFold,
          ),
        );
      } else {
        save(); // If all validations pass, proceed with saving
      }
    }
  }

}
