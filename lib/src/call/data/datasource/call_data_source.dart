import 'dart:convert';
import 'dart:io' as io;
import 'package:http/http.dart' as http;

import '../../../../core/data/datasource/callsv_data_source.dart';

import '../../../../core/errors/exceptions.dart';

import '../../../../core/utils/typedef.dart';
import '../models/agent_model.dart';
import '../models/call_log_model.dart';
import '../models/calling_info_model.dart';

abstract class CallDataSrc {
  Future<CallingInfoModel> getCallingInfo();
  Future<List<CallLogModel>> getCallLog();
  Future<List<AgentModel>> getAgentList();
  Future<CallLogModel> redirect(String target);
}

class CallRemoteDataSrc extends CallSvDataSrc implements CallDataSrc {
  const CallRemoteDataSrc(super.client);

  @override
  Future<CallingInfoModel> getCallingInfo() async {
    final response = await post(path: 'callapi/getMyCallingInfo', params: null);

    return CallingInfoModel.fromMap(response);
  }

  @override
  Future<List<CallLogModel>> getCallLog() async {
    final response = await post(path: 'callapi/getMyCallHistory', params: null);

    final list = response.cast<DataMap>();
    // .map((i) => AgentModel.fromMap(i)).toList();

    List<CallLogModel> ret =
        list.map<CallLogModel>((i) => CallLogModel.fromMap(i)).toList();

    return ret;
  }

  @override
  Future<List<AgentModel>> getAgentList() async {
    final response = await post(path: 'callapi/getOrgAgentList', params: null);
    final list = response.cast<DataMap>();
    // .map((i) => AgentModel.fromMap(i)).toList();

    List<AgentModel> ret =
        list.map<AgentModel>((i) => AgentModel.fromMap(i)).toList();

    return ret;

    //return AgentModel.fromMap(response);
  }

  @override
  Future<CallLogModel> redirect(String target) async {
    final response = await post(path: 'callapi/redirect', params: {target: target, 'callId': '0'});
    return CallLogModel.fromMap(response);
  }
}
