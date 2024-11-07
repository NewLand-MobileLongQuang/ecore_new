import 'dart:io';


import '../../../../../core/utils/typedef.dart';
import '../entities/es_advanced_search.dart';
import '../usecase/search.dart';


abstract class ES_AdvancedRepository {
  ResultFuture<List<ES_AdvancedSearch>> search({required SearchAdvancedParams params});
  ResultFuture<ES_AdvancedSearch> getByAdvancedNo({required SearchAdvancedParams params});
}