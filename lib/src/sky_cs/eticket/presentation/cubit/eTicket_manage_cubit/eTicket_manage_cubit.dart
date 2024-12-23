import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../data/models/rq_sky_eticket_merge_lst_model.dart';
import '../../../data/models/rq_sky_eticket_merge_model.dart';
import '../../../domain/entities/sky_eticket_info.dart';
import '../../../domain/usecases/merge_eticket.dart';
import '../../../domain/usecases/search_eticket.dart';

part 'eTicket_manage_state.dart';

class eTicketManageCubit extends Cubit<eTicketManageState> {
  eTicketManageCubit({
    required SearchETicketSkyCSUseCase searchEticketSkyCSUseCase,
    required MergeETicketSkyCSUseCase mergeEticketSkyCSUseCase,

  }) : _searchEticketSkyCSUseCase = searchEticketSkyCSUseCase,
       _mergeEticketSkyCSUseCase = mergeEticketSkyCSUseCase,
        super(eTicketManageInitial());
  final SearchETicketSkyCSUseCase _searchEticketSkyCSUseCase;
  final MergeETicketSkyCSUseCase _mergeEticketSkyCSUseCase;

  int pageIndex = 0;
  bool loadingMore = true;
  static const int pageSize = 10;

  Future<void> init() async {
    emit(eTicketManageLoading());
    try {
      final listeticket = await _searchEticketSkyCSUseCase(
        SearchETicketSkyCSParams(
         FlagOutOfDate:'',
         FlagNotRespondingSLA:'',
         DepartmentCode:'',
         AgentCode:'',
         TicketStatus:'',
         TicketPriority:'',
         TicketDeadlineFrom:'',
         TicketDeadlineTo:'',
         TicketType:'',
         TicketDetail:'',
         TicketName:'',
         TicketID:'',
         CreateDTimeUTCFrom:'',
         CreateDTimeUTCTo:'',
         LUDTimeUTCFrom:'',
         LUDTimeUTCTo:'',
         TicketSource:'',
         OrgID:'',
         CustomerCompany:'',
         Follower:'',
         TicketCustomType:'',
         Description:'',
         CreateBy:'',
         FlagTicketDeadlineDTime:'',
         TicketPhoneNo:'',
         FlagGetOtherOrgID:'1',
         FlagGetOtherDepartment:'1',
          Ft_PageIndex: '0',
          Ft_PageSize: '200',
          CustomerCodeSys: '',
        ),
      );
      print("LIST ETicket ======> ${listeticket}");
      final listeticketFold = listeticket.fold((l) => l, (r) => r) as List<SKY_TicketInfo>;

      emit(eTicketManageLoaded(
        listeticket: listeticketFold,
      ));
    } catch (e) {
      emit(eTicketManageError(e.toString()));

    }
  }

  Future<void> loadMore() async {
    try{
      if(state is eTicketManageLoaded && state is! ETicketSkyCSManageLoadingMore && loadingMore) {
        emit(ETicketSkyCSManageLoadingMore(listeticket: (state as eTicketManageLoaded).listeticket));
        final listLoadMore = await _searchEticketSkyCSUseCase(
          SearchETicketSkyCSParams(
            FlagOutOfDate:'',
            FlagNotRespondingSLA:'',
            DepartmentCode:'',
            AgentCode:'',
            TicketStatus:'',
            TicketPriority:'',
            TicketDeadlineFrom:'',
            TicketDeadlineTo:'',
            TicketType:'',
            TicketDetail:'',
            TicketName:'',
            TicketID:'',
            CreateDTimeUTCFrom:'',
            CreateDTimeUTCTo:'',
            LUDTimeUTCFrom:'',
            LUDTimeUTCTo:'',
            TicketSource:'',
            OrgID:'',
            CustomerCompany:'',
            Follower:'',
            TicketCustomType:'',
            Description:'',
            CreateBy:'',
            FlagTicketDeadlineDTime:'',
            TicketPhoneNo:'',
            FlagGetOtherOrgID:'1',
            FlagGetOtherDepartment:'1',
            Ft_PageIndex: '0',
            Ft_PageSize: '200',
            CustomerCodeSys: '',
          ),
        );
        final listLoadMoreFold = listLoadMore.fold((l) => l, (r) => r) as List<SKY_TicketInfo>;
        emit(eTicketManageLoaded(
          listeticket: (state as eTicketManageLoaded).listeticket + listLoadMoreFold,
        ));
        loadingMore = (listLoadMore.fold((l) => null, (r) => r)?.length ?? 0) == pageSize;
        ++pageIndex;
      }
    }
    catch(e) {
      emit(eTicketManageError(e.toString()));
    }
  }

  void merge(List<String> lstmerge,BuildContext context) {
    mergeticket(lstmerge,context);
  }

  Future<void> mergeticket(List<String> lstmerge, BuildContext context) async {
    //emit(eTicketManageLoading());

    final List<RQ_SKY_eTicket_Merge_lst_Model> eticketInfoList = [];
    lstmerge.forEach((element) {
      eticketInfoList.add(RQ_SKY_eTicket_Merge_lst_Model(
        TicketID: element,
      ));
    });

    print("CHECK LIST ${eticketInfoList}");

    final jsontest = RQ_SKY_eTicket_Merge_Model(
      TicketID: '',
      OrgID: '7206207001',
      Lst_ET_Ticket: eticketInfoList,
    );

    try {
      final result = await _mergeEticketSkyCSUseCase.call(
        MergeETicketSkyCSParams(
          strJson: jsonEncode(jsontest.toJson()),
        ),
      );
      print('CHECK create ${result}');

      // Kiểm tra kết quả, nếu có lỗi, hiển thị Snackbar
      if ( result.toString().isNotEmpty) {
        final errorMessage = 'Lỗi: ' + result.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
        return; // Dừng quá trình nếu có lỗi
      }

      // Nếu không có lỗi, tiếp tục
      emit(eTicketCreateStateSuccess());
    } catch (e) {
      emit(eTicketManageError(e.toString()));

      // Hiển thị snackbar nếu có lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã có lỗi xảy ra: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

}
