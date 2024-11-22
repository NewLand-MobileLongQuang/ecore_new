import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../data/models/rq_sky_eticket_split_lst_model.dart';
import '../../../data/models/rq_sky_eticket_split_model.dart';
import '../../../domain/entities/sky_eticket_getticketID.dart';
import '../../../domain/usecases/search_ticketID_group.dart';
import '../../../domain/usecases/split_eticket.dart';

part 'eTicket_detail_state.dart';

class eTicketDetailCubit extends Cubit<eTicketDetailState> {
  eTicketDetailCubit({
    required SearchTicketIDGroupUseCase getByETIDUseCase,
    required SplitETicketSkyCSUseCase splitETIDUseCase,
  }) :
        _getByETIDUseCase = getByETIDUseCase,
        _splitETIDUseCase = splitETIDUseCase,
  super(eTicketDetailInitial());
  final   _getByETIDUseCase;
  final   SplitETicketSkyCSUseCase _splitETIDUseCase;
  late SKY_GetTicketID listcusFold;

  Future<void> init(String cus) async {
    print("DETAIL: =========> }");
    emit(eTicketDetailLoading());
    try {
      final ETinfo = await _getByETIDUseCase(
        SearchTicketIDGroupParams(
          TicketID:cus,
        ),
      );
      listcusFold = ETinfo.fold((l) => l, (r) => r) as SKY_GetTicketID;

      print("DETAIL: =========> ${listcusFold}");
      emit(eTicketDetailStateLoaded(
          ETID: listcusFold
      ));
    } catch (e) {
      emit(eTicketDetailStateError(e.toString()));
    }
  }
  Future<void> split(List<int> lstmerge, BuildContext context) async {
    // Create a list to hold the filtered items
    final List<RQ_SKY_eTicket_Split_lst_Model> eticketInfoList = [];

    listcusFold.Lst_ET_TicketMessage.forEach((element) {
      if (lstmerge.contains(element.AutoId)) {
        // Add the filtered item to the eticketInfoList
        eticketInfoList.add(RQ_SKY_eTicket_Split_lst_Model(
          TicketID: element.TicketID,
          AutoID: element.AutoId,
        ));
      }
    });

    final jsontest = RQ_SKY_eTicket_Split_Model(
      TicketID: listcusFold.Lst_ET_Ticket[0].TicketID,
      OrgID: '7206207001',
      Lst_ET_TicketMessage: eticketInfoList,
    );

    try {
      final result = await _splitETIDUseCase.call(
        SplitETicketSkyCSParams(
          strJson: jsonEncode(jsontest.toJson()),
        ),
      );
      print('CHECK create ${result}');

      if (result.toString().isNotEmpty) {
        final errorMessage = 'Lỗi: ' + result.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã có lỗi xảy ra: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

}
