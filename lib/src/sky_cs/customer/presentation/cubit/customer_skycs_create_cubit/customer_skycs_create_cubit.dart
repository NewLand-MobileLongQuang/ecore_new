import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecore/core/configs/app_config.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_customer_code_sys.dart';
import 'package:ecore/src/sky_cs/customer/data/models/rq_sky_customer_model.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/create_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_customer_partner_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_customer_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_list_option.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_group.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_zalo_user.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../../data/models/rq_sky_ctm_group_model.dart';
import '../../../data/models/rq_sky_ctm_partner_type_model.dart';
import '../../../data/models/rq_sky_email_model.dart';
import '../../../data/models/rq_sky_gov_id_model.dart';
import '../../../data/models/rq_sky_phone_model.dart';
import '../../../data/models/rq_sky_user_manager_model.dart';
import '../../../data/models/rq_sky_zalo_user_follower_model.dart';
import '../../../data/models/sky_customer_column_model.dart';
import '../../../data/models/sky_customer_group_model.dart';
import '../../../domain/entities/rt_sky_customer_type.dart';
import '../../../domain/entities/sky_customer_partner_type.dart';
import '../../../domain/entities/sky_customer_zalo_user.dart';
import '../../../domain/entities/sky_option_value.dart';

part 'customer_skycs_create_state.dart';

class CustomerSkyCSCreateCubit extends Cubit<CustomerSkyCSCreateState> {
  CustomerSkyCSCreateCubit({
    required SearchCustomerGroupUseCase searchCustomerGroupUseCase,
    required SearchCustomerColumnUseCase searchCustomerColumnUseCase,
    required GetListOptionUseCase getListOptionUseCase,
    required CreateCustomerSkyCSUseCase createCustomerSkyCSUseCase,
    required GetCustomerCodeSysUseCase getCustomerCodeSysUseCase,
    required GetAllCustomerTypeUseCase getAllCustomerTypeUseCase,
    required GetAllCustomerPartnerTypeUseCase getAllCustomerPartnerTypeUseCase,
    required SearchZaloUserUseCase searchZaloUserUseCase,
  }) : _searchCustomerGroupUseCase = searchCustomerGroupUseCase,
        _searchCustomerColumnUseCase = searchCustomerColumnUseCase,
        _getListOptionUseCase = getListOptionUseCase,
        _createCustomerSkyCSUseCase = createCustomerSkyCSUseCase,
        _getCustomerCodeSysUseCase =getCustomerCodeSysUseCase,
        _getAllCustomerTypeUseCase = getAllCustomerTypeUseCase,
        _getAllCustomerPartnerTypeUseCase = getAllCustomerPartnerTypeUseCase,
        _searchZaloUserUseCase = searchZaloUserUseCase,
        super(CustomerSkyCSCreateStateInitial());

  final SearchCustomerGroupUseCase _searchCustomerGroupUseCase;
  final SearchCustomerColumnUseCase _searchCustomerColumnUseCase;
  final GetListOptionUseCase _getListOptionUseCase;
  final CreateCustomerSkyCSUseCase _createCustomerSkyCSUseCase;
  final GetCustomerCodeSysUseCase _getCustomerCodeSysUseCase;

  final GetAllCustomerTypeUseCase _getAllCustomerTypeUseCase;
  final GetAllCustomerPartnerTypeUseCase _getAllCustomerPartnerTypeUseCase;
  final SearchZaloUserUseCase _searchZaloUserUseCase;


  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String> _controllersdynamic = {};
  late final String customerCode;
  late final String customerName;
  late final String customerType;

  Map<String, TextEditingController> get controllers => _controllers;
  List<bool> isCheckNull = [];

  Future<void> init() async {
    emit(CustomerSkyCSCreateLoading());
    try {
      final result = await _getCustomerCodeSysUseCase.call(GetCustomerCodeSysParams());
      //final resultFold = result.fold((l) => null, (r) => r)!;
      final listGroup = await _searchCustomerGroupUseCase.call(
        const SearchCustomerGroupParams(
          ScrTplCodeSys: 'ScrTplCodeSys.2023',
          FlagActive: '1',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final listColumn = await _searchCustomerColumnUseCase.call(
        const SearchCustomerColumnParams(
          ScrTplCodeSys: 'ScrTplCodeSys.2023',
          FlagActive: '1',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
          OrderByClause: 'ProvinceCode asc',
        ),
      );

      final listGroupFold = listGroup.fold((l) => l, (r) => r) as List<SKY_CustomerGroupModel>;
      final listColumnFold = listColumn.fold((l) => l, (r) => r) as List<SKY_CustomerColumnModel>;

      for (var column in listColumnFold) {
        _controllers[column.ColCodeSys] = TextEditingController();
        if(column.FlagIsColDynamic =="1"){
          _controllersdynamic[column.ColCodeSys]='1';
        }
        else {
          _controllersdynamic[column.ColCodeSys]='0';
        }
      }

      // check API
       final customerType = await _getAllCustomerTypeUseCase.call(const GetAllCustomerTypeParams());
       final listCustomerTypeFold = customerType.fold((l) => l, (r) => r) as RT_SKY_CustomerType;
       final customerPartnerType = await _getAllCustomerPartnerTypeUseCase.call(GetAllCustomerPartnerTypeParams());
       final listCustomerPartnerTypeFold = customerPartnerType.fold((l) => l, (r) => r) as List<SKY_CustomerPartnerType>;
       final zaloUser = await _searchZaloUserUseCase.call(const SearchZaloUserParams(ZaloUserName: ''));
       final listZaloUserFold = zaloUser.fold((l) => l, (r) => r) as List<SKY_CustomerZaloUser>;

       emit(CustomerSkyCSCreateLoaded(
         listGroupFold: listGroupFold,
         listColumnFold: listColumnFold,
         listCustomerTypeFold :listCustomerTypeFold,
         listCustomerPartnerTypeFold : listCustomerPartnerTypeFold,
         listZaloUserFold : listZaloUserFold,
       ));
    } on Exception catch (e) {
      emit(CustomerSkyCSCreateError(e.toString()));
    }
  }


  @override
  Future<void> close() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    return super.close();
  }

  Future<List<SKY_OptionValue>> getListOption(String colCodeSys) async {
    try {
      final listOption = await _getListOptionUseCase.call(
        GetListOptionParams(
          ScrTplCodeSys: 'ScrTplCodeSys.2023',
          ColCodeSys: colCodeSys,
          FlagActive: '1',
        ),
      );
      final listOptionFold = (listOption.fold((l) => l, (r) => r) as List<SKY_CustomerColumn>).first.Lst_MD_OptionValue;
      return listOptionFold;
    } catch (e) {
      throw Exception('Failed to fetch options: $e');
    }
  }

  Future<void> save() async{
    emit(CustomerSkyCSCreateLoading());
    final List<Map<String, String>> customerInfoList = [];
    final List<RQ_SKY_PhoneModel> phone = [];
    final List<RQ_SKY_ZaloUserFollowerModel> Zalo = [];
    final List<RQ_SKY_EmailModel> Email = [];
    final List<RQ_SKY_CtmGroupModel> GrpCode = [];
    final List<RQ_SKY_UserManagerModel> userManage = [];
    final List<RQ_SKY_CtmPartnerTypeModel> partnerType = [];
    final List<RQ_SKY_GovIDModel> goVid = [];
    String govid="";
    String govDate="";


    controllers.forEach((key, controller) {
      print("CHECK COntroller ${key}");
      if(key=='GovID') { govid=controller.text;}
      if(key=='GovIDDate'){govDate=controller.text;}

      if( _controllersdynamic[key]=='0')
      {
        if(key == "CustomerCode"){
          customerCode = controller.text;
        }
        else
        {
          if(key == "CustomerName"){
            customerName = controller.text;
          }
          else{
            if(key == "CustomerType"){
              customerType = controller.text;
            }
            else{
              if(controller.text.isNotEmpty) 
              {
                if(key == 'CtmPhoneNo'){
                    phone.add(RQ_SKY_PhoneModel(
                      OrgID: '7206207001',
                      CustomerCodeSys: AppConfig.current().scrTplCodeSys,
                      CtmPhoneNo:controller.text,
                      FlagDefault: '1',)
                    );
                }
                else{
                  if(key == 'ZaloUserFollowerId'){
                    Zalo.add(RQ_SKY_ZaloUserFollowerModel(
                      OrgID: '7206207001',
                      CustomerCodeSys: AppConfig.current().scrTplCodeSys,
                      ZaloUserFollowerId:controller.text,
                      SolutionCode:'SKYCS',
                      FlagDefault: '1',
                    ));
                  }
                  else{
                    if(key == 'CtmEmail'){
                      Email.add(RQ_SKY_EmailModel(
                        OrgID: '7206207001',
                        CustomerCodeSys: AppConfig.current().scrTplCodeSys,
                        CtmEmail: controller.text,
                        FlagDefault: '1',)
                      ) ;
                    }
                    else{
                      if(key == 'CustomerGrpCode'){
                        GrpCode.add(RQ_SKY_CtmGroupModel(
                          OrgID: '7206207001',
                          CustomerCodeSys: AppConfig.current().scrTplCodeSys,
                          CustomerGrpCode:controller.text,
                        ));
                      }
                      else{
                        if(key == 'UserCodeMng'){
                          userManage.add(RQ_SKY_UserManagerModel(
                            OrgID: '7206207001',
                            UserCodeMng:controller.text,
                          )) ;
                        }
                        else {
                          if (key == 'PartnerType') {
                            partnerType.add(RQ_SKY_CtmPartnerTypeModel(
                              OrgID: '7206207001',
                              PartnerType: controller.text,
                            )) ;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else {
        if(controller.text.isNotEmpty) {
          customerInfoList.add({
            'ColCodeSys': key,
            'ColValue': controller.text,
      });
        }
      }
    });

    if(govid.isNotEmpty){
      goVid.add(RQ_SKY_GovIDModel(
        OrgID: 7206207001,
        GovID:govid,
        GovIDDate: govDate,
        GovIDType: 'ORTHER',
        CustomerCodeSys: AppConfig.current().scrTplCodeSys,
      ),
      );
    }
    final test = RQ_SKY_CustomerModel(
      CountryCodeContact: 'TL',
      CountryCodeDelivery: 'VN',
      CountryCodeInvoice: 'VN',
      CreateBy: 'user02@skycs.vn',
      CreateDTimeUTC: '2024-01-01 12:00:00',
      CustomerCode: customerCode,
      CustomerCodeInvoice: customerCode,
      CustomerCodeSysERP: 'CTMCS.DAI.68235',
      CustomerName: customerName,
      CustomerType: customerType,
      FlagAllUserManager: '0',
      GovID: [],
      OrgID: 7206207001,
      NetworkID: 7206207001,
      JsonCustomerInfo: jsonEncode(customerInfoList),
    );

    final result = await _createCustomerSkyCSUseCase.call(
           CreateCustomerSkyCSParams(
             strJson: jsonEncode(test.toJson()),
             strJsonZaloUserFollower: jsonEncode(Zalo),
             strJsonEmail: jsonEncode(Email),
             strJsonPhone: jsonEncode(phone),
             strJsonCtmGroup: jsonEncode(GrpCode),
             strJsonCtmPartnerType: jsonEncode(partnerType),
             strJsonUserManager: jsonEncode(userManage),
             strJsonGovID: '[]',
             ScrTplCodeSys: AppConfig.current().scrTplCodeSys,
           ),
         );
         emit(CustomerSkyCSCreateSuccess());
  }

  void validateAndSave(BuildContext context) {
    final currentState = state;

    if (currentState is CustomerSkyCSCreateLoaded) {
      final List<String> missingFields = [];

      controllers.forEach((key, controller) {
        final col = currentState.listColumnFold.firstWhere((element) => element.ColCodeSys == key);
        if (col.FlagIsNotNull == '1' && controller.text.isEmpty) {
          missingFields.add(col.ColCaption);
        }
      });

      if (missingFields.isNotEmpty) {
        final errorMessage = 'Các trường sau không được để trống:\n${missingFields.join('\n')}';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
        emit(
          CustomerSkyCSCreateCheck(
            listGroupFold: (state as CustomerSkyCSCreateLoaded).listGroupFold,
            listColumnFold: (state as CustomerSkyCSCreateLoaded).listColumnFold,
            listCustomerTypeFold: (state as CustomerSkyCSCreateLoaded).listCustomerTypeFold,
            listCustomerPartnerTypeFold: (state as CustomerSkyCSCreateLoaded).listCustomerPartnerTypeFold,
            listZaloUserFold: (state as CustomerSkyCSCreateLoaded).listZaloUserFold,
          )
        );
      } else {
        save();
      }
    }
  }
}
