import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/es_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/entities/rt_es_customer_detail.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/create_customer.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_by_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/get_customer_code_sys.dart';
import 'package:ecore/src/e_service/customer_manage/domain/usecases/search_customer.dart';

abstract class ES_CustomerRepository {
  ResultFuture<List<ES_Customer>> search({required SearchCustomerParams params});
  ResultFuture<ES_Customer> create({required CreateCustomerParams params});
  ResultFuture<String> getCustomerCodeSys({required GetCustomerCodeSysParams params});
  ResultFuture<RT_ESCustomerDetail> getByCustomerCodeSys({required GetByCustomerCodeSysParams params});
}