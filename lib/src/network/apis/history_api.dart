import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:global_template/global_template.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class HistoryApi {
  Future<List<HistoryModel>> getAllHistory() async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.get(
        '${appConfig.baseApiUrl}/${appConfig.historyController}',
        headers: appConfig.headersApi,
      );
      final Map<String, dynamic> responseJson = json.decode(response.body);
      if (responseJson['status'] == 'ok') {
        final List list = responseJson['data'];
        final listHistory = list.map((e) => HistoryModel.fromJson(e)).toList();
        return listHistory;
      } else {
        throw responseJson['message'];
      }
    });
    return result;
  }

  Future<List<HistoryModel>> getHistoryByUser({@required String idUser}) async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.get(
        '${appConfig.baseApiUrl}/${appConfig.historyController}/getHistoryByUser?id_user=$idUser',
        // headers: appConfig.headersApi,
      );
      final Map<String, dynamic> responseJson = json.decode(response.body);
      if (responseJson['status'] == 'ok') {
        final List list = responseJson['data'];
        final listHistory = list.map((e) => HistoryModel.fromJson(e)).toList();
        return listHistory;
      } else {
        throw responseJson['message'];
      }
    });
    return result;
  }
}
