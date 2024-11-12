import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rt_sky_customer_all_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/rt_sky_customer_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_contact.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_group.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_hist.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_info.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_partner_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/entities/sky_customer_zalo_user.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/create_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/delete_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_by_customer_code_sys.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_customer_partner_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_all_customer_type.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_by_customer_code_sys.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/get_list_option.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_column.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_contact.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_group.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_customer_hist.dart';
import 'package:ecore/src/sky_cs/customer/domain/usecases/search_zalo_user.dart';

abstract class SKY_CustomerRepository {
  // create
  ResultFuture<List<SKY_CustomerGroup>> searchCustomerGroup({required SearchCustomerGroupParams params});
  ResultFuture<List<SKY_CustomerColumn>> searchCustomerColumn({required SearchCustomerColumnParams params});
  ResultFuture<List<SKY_CustomerColumn>> getListOption({required GetListOptionParams params});
  ResultFuture<String> createCustomerSkyCS({required CreateCustomerSkyCSParams params});
  ResultFuture<RT_SKY_CustomerType> getAllCustomerType({required GetAllCustomerTypeParams params});
  ResultFuture<List<SKY_CustomerPartnerType>> getAllCustomerPartnerType({required GetAllCustomerPartnerTypeParams params});
  ResultFuture<List<SKY_CustomerZaloUser>> searchZaloUser({required SearchZaloUserParams params});

  // manage + detail
  ResultFuture<List<SKY_CustomerInfo>> searchCustomer({required SearchCustomerSkyCSParams params});
  ResultFuture<SKY_CustomerDetail> getByCustomerCodeSys({required GetByCustomerCodeSysParams params});
  ResultFuture<List<SKY_CustomerHist>> searchCustomerHist({required SearchCustomerHistParams params});
  ResultFuture<List<SKY_CustomerContact>> searchCustomerContact({required SearchCustomerContactParams params});
  ResultFuture<RT_SKY_CustomerAllDetail> getAllByCustomerCodeSys({required GetAllByCustomerCodeSysParams params});
  ResultFuture<String> deleteCustomerSkyCS({required DeleteCustomerParams params});
}