import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../errors/exceptions.dart';
import '../../utils/typedef.dart';
import '../../utils/uri_form.dart';

class BaseRemoteDataSrc {
  const BaseRemoteDataSrc(this._client);

  final http.Client _client;

  String get baseUrl => '';

  Map<String, String>? getHeaders() {
    return null;
  }

  Future<dynamic> doPostWithHeaders(
      {required String path,
      required Map<String, String> headers,
      DataMap? params}) async {
    try {
      if (params != null) {
        if (headers?['Content-Type'] == null) {
          headers['Content-Type'] = "application/json";
        }
      }

      //final uri = Uri.https(baseUrl, path);
      final uri = UriForm.convertUri(url: baseUrl, path: path);
      final response = await _client.post(uri,
          headers: headers,
          //body: jsonEncode({'email': email, 'password': password})
          body: params != null ? jsonEncode(params) : null,

      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // throw ApiException(
        //     Message:response.body, Code: 'res.ErrorCode');
        return jsonDecode(response.body);
      } else
        throw ApiException(
            Message: response.body, Code: response.statusCode.toString());
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(Message: e.toString(), Code: '505');
    }
  }

  Future<dynamic> doPost({required String path, DataMap? params}) async {
    final  headers = getHeaders() ?? {};
    return await doPostWithHeaders(path: path, headers: headers, params: params);
  }

  Future<dynamic> doPostWithHeadersAndFile(
      {required String path,
      required Map<String, String> headers,
      required String filePath,
      DataMap? params}) async {
    try {
      final uri = UriForm.convertUri(url: baseUrl, path: path);
      final request = http.MultipartRequest(
        'POST',
        uri,
      );
      request.headers.addAll(headers);
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          filePath,
        ),

      );

      if(params!=null)
        {
         params.forEach((key, value) {
           request.fields[key]= value.toString();
         });
        }



      final response = await request.send();
      final responseStr = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(responseStr);
      } else {
        throw ApiException(
          Message: response.toString(),
          Code: response.statusCode.toString(),
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(Message: e.toString(), Code: '505');
    }
  }
}
