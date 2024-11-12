import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecore/core/configs/app_config.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rt_sky_customer_all_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_call_call.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_cpn_campaign_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_et_ticket.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_by_customer_code_sys.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_by_customer_code_sys.dart';
import 'package:meta/meta.dart';

part 'customer_skycs_detail_state.dart';

class CustomerSkyCSDetailCubit extends Cubit<CustomerSkyCSDetailState> {
  CustomerSkyCSDetailCubit({
    required GetByCustomerCodeSysUseCase getByCustomerCodeSysUseCase,
    required GetAllByCustomerCodeSysUseCase getAllByCustomerCodeSysUseCase,
  }) :_getByCustomerCodeSysUseCase = getByCustomerCodeSysUseCase,
      _getAllByCustomerCodeSysUseCase = getAllByCustomerCodeSysUseCase,
        super(CustomerSkyCSDetailInitial());

  final GetByCustomerCodeSysUseCase _getByCustomerCodeSysUseCase;
  final GetAllByCustomerCodeSysUseCase _getAllByCustomerCodeSysUseCase;

  Future<void> init(String customerCodeSys) async {
    emit(CustomerSkyCSDetailLoading());
    try {
      final customerDetail = await _getByCustomerCodeSysUseCase(
        GetByCustomerCodeSysParams(
          ScrTplCodeSys: AppConfig.current().scrTplCodeSys,
          CustomerCodeSys: customerCodeSys,
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final customerAllDetail = await _getAllByCustomerCodeSysUseCase(
        GetAllByCustomerCodeSysParams(
          CustomerCodeSys: customerCodeSys,
        ),
      );

      final customerDetailFold = customerDetail.fold((l) => l, (r) => r) as SKY_CustomerDetail;
      final customerAllDetailFold = customerAllDetail.fold((l) => l, (r) => r) as RT_SKY_CustomerAllDetail;


      emit(CustomerSkyCSDetailStateLoaded(
        customerDetail: customerDetailFold,
        listCall: customerAllDetailFold.Lst_Call_Call,
        listTicket: customerAllDetailFold.Lst_ET_Ticket,
        listCampaign: customerAllDetailFold.Lst_Cpn_CampaignCustomer,
        listPhone: customerDetailFold.Lst_Mst_CustomerPhone.map((e) => e.CtmPhoneNo).toList(),
      ));
    } catch (e) {
      emit(CustomerSkyCSDetailStateError(message: e.toString()));
    }
  }
}
