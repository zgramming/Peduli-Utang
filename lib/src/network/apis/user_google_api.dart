import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:global_template/global_template.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class UserGoogleApi {
  Future<List<UserGoogleModel>> getAllUser() async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.get(
        '${appConfig.baseApiUrl}/${appConfig.userGoogleController}/getAllUser',
        headers: appConfig.headersApi,
      );
      final Map<String, dynamic> responseJson = json.decode(response.body);
      if (responseJson['status'] == 'ok') {
        final List list = responseJson['data'];
        final listUser = list.map((e) => UserGoogleModel.fromJson(e)).toList();
        return listUser;
      } else {
        throw responseJson['message'];
      }
    });
    return result;
  }

  /// Pilihan bisa id_user atau email_user
  Future<List<UserGoogleModel>> getUserByIdOrEmail({
    @required String idUser,
    @required String emailUser,
    @required String idOrEmail,
  }) async {
    final result = await reusableRequestServer.requestServer(() async {
      final baseUrl =
          '${appConfig.baseApiUrl}/${appConfig.userGoogleController}/getUserByIdOrEmail';
      final chooseURL = idOrEmail == 'id_user'
          ? '$baseUrl?id_or_email=$idOrEmail&id_user=$idUser'
          : '$baseUrl?id_or_email=$idOrEmail&email_user=$emailUser';
      final response = await http.get(
        chooseURL,
        // headers: appConfig.headersApi,
      );
      // print(response.body);
      final Map<String, dynamic> responseJson = json.decode(response.body);
      if (responseJson['status'] == 'ok') {
        final List list = responseJson['data'];

        final listUser = list.map((e) => UserGoogleModel.fromJson(e)).toList();
        return listUser;
      } else {
        print('masuk salah');

        throw responseJson['message'];
      }
    });
    return result;
  }

  Future<String> validateUser({
    @required String idUser,
    @required String nameUser,
    @required String emailUser,
    @required String imageUser,
    @required String tokenFCM,
  }) async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.post(
        '${appConfig.baseApiUrl}/${appConfig.userGoogleController}/validateUser',
        body: {
          'id_user': '$idUser',
          'name_user': '$nameUser',
          'email_user': '$emailUser',
          'image_user': '$imageUser',
          'token_fcm': '$tokenFCM',
        },
      );
      final Map<String, dynamic> responseJson = json.decode(response.body);
      print(responseJson);
      final String message = responseJson['message'];
      if (responseJson['status'] == 1) {
        return message;
      } else {
        throw message;
      }
    });
    return result;
  }
}
