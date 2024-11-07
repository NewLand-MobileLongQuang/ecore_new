import 'dart:io';

import '../../../../../core/utils/typedef.dart';
import '../entities/es_ro_detail.dart';
import '../entities/es_ro_error_type.dart';
import '../entities/es_ro_product.dart';
import '../entities/rt_es_ro_detail.dart';
import '../entities/rt_es_ro_error_component.dart';
import '../usecases/delete.dart';
import '../usecases/finish.dart';
import '../usecases/get_by_ro_no.dart';
import '../usecases/search.dart';
import '../usecases/search_error_component.dart';
import '../usecases/search_error_type.dart';
import '../usecases/search_product.dart';
import '../usecases/update.dart';

abstract class ES_RORepository {
  ResultFuture<List<ES_RODetail>> search({required SearchROParams params});
  ResultFuture<RT_ES_RODetail> getByRONo({required GetByRONoParams params});
  ResultVoid update({required UpdateROParams params});
  ResultVoid delete({required DeleteROParams params});
  ResultFuture<List<ES_ROErrorType>> searchErrorType({required SearchErrorTypeParams params});
  ResultFuture<List<ES_ROProduct>> searchProduct({required SearchProductParams params});
  ResultFuture<RT_ES_ROErrorComponent> searchErrorComponent({required SearchErrorComponentParams params});
  ResultVoid finish({required FinishROParams params});
}