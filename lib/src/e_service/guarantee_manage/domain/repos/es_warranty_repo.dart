import 'dart:io';

import 'package:ecore/core/modules/auth/domain/entities/sys_user.dart';
import 'package:ecore/core/utils/typedef.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_detail.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/create.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/delete.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_by_warranty_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/get_input_by_serial_no.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/search.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/usecases/update.dart';


abstract class ES_WarrantyRepository {
  ResultFuture<List<ES_WarrantyDetail>> search({required SearchWarrantyParams params});
  ResultFuture<RT_ES_WarrantyDetail> getByWarrantyNo({required GetByWarrantyNoParams params});
  ResultVoid update({required UpdateWarrantyParams params});
  ResultVoid delete({required DeleteWarrantyParams params});
  ResultFuture<List<RT_ES_WarrrantyActivateByQR>> getInputBySerialNo({required GetInputBySerialNoParams params});
  ResultFuture<RT_ES_WarrantyDetail> create({required CreateWarrantyParams params});
  ResultFuture<SysUser> getForCurrentUser();
}