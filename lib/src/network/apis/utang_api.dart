import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:flutter/foundation.dart';
import 'package:global_template/global_template.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class UtangApi {
  static const _nameFileAPI = 'file';
  final String baseApiUtang = '${appConfig.baseApiUrl}/${appConfig.utangController}';

  Future<List<UtangModel>> getUtang(String idUser, {String sebagaiApa}) async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.get(
        '$baseApiUtang/getUtang?id_user=$idUser&sebagai_apa=$sebagaiApa',
      );
      final Map<String, dynamic> responseJson = json.decode(response.body);

      if (responseJson['status'] == 'ok') {
        final List list = responseJson['data'];
        final listUtang = list.map((e) => UtangModel.fromJson(e)).toList();
        return listUtang;
      } else {
        throw responseJson['message'];
      }
    });
    return result;
  }

  Future<String> addUtang({
    @required String pembertang,
    @required String pengutang,
    @required int totalUtang,
    @required DateTime tglKembali,
    @required String keterangan,
    @required String ttd,
    @required File selfieImage,
  }) async {
    final result = await reusableRequestServer.requestServer(() async {
      final stream = http.ByteStream(Stream.castFrom(selfieImage.openRead()));
      final length = await selfieImage.length();
      final uri = Uri.parse('$baseApiUtang/addUtang');
      final request = http.MultipartRequest('POST', uri);
      final multipartFile = http.MultipartFile(
        _nameFileAPI, //! Nama field yang ada di API
        stream,
        length,
        filename: basename(selfieImage.path),
        // contentType: MediaType('image', 'jpg'),
      );
      request.fields['pembertang'] = '$pembertang';
      request.fields['pengutang'] = '$pengutang';
      request.fields['total_utang'] = '$totalUtang';
      request.fields['tgl_kembali'] = '$tglKembali';
      request.fields['keterangan'] = '$keterangan';
      request.fields['ttd'] = '$ttd';
      request.files.add(multipartFile);
      final response = await request
          .send()
          .timeout(Duration(minutes: 1), onTimeout: () => throw ConstText.TIMEOUT_EXCEPTION);
      final responseString = await response.stream.bytesToString();
      final Map<String, dynamic> responseJson = json.decode(responseString);
      final String message = responseJson['message'];

      if (responseJson['status'] == 1) {
        return message;
      } else {
        throw message;
      }
    });
    return result;
  }

  Future<String> cicilUtang({
    @required String idUtang,
    @required String pembertang,
    @required int totalCicil,
  }) async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.post(
        '$baseApiUtang/cicilUtang',
        body: {
          'id_utang': '$idUtang',
          'pembertang': '$pembertang',
          'total_cicil': '$totalCicil',
        },
      );
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final String message = responseJson['message'];
      if (responseJson['status'] == 1) {
        return message;
      } else {
        throw message;
      }
    });
    return result;
  }

  Future<String> ikhlaskanUtang({
    @required String idUtang,
  }) async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.post(
        '$baseApiUtang/ikhlaskanUtang',
        body: {'id_utang': '$idUtang'},
      );
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final String message = responseJson['message'];
      if (responseJson['status'] == 1) {
        return message;
      } else {
        throw message;
      }
    });
    return result;
  }

  Future<String> confirmUtang({
    @required String idUtang,
    @required String pengutang,
  }) async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.post(
        '$baseApiUtang/confirmUtang',
        body: {
          'id_utang': '$idUtang',
          'pengutang': '$pengutang',
        },
      ).timeout(Duration(seconds: 30), onTimeout: () {
        throw ConstText.TIMEOUT_EXCEPTION;
      });
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final String message = responseJson['message'];
      if (responseJson['status'] == 1) {
        return message;
      } else {
        throw message;
      }
    });
    return result;
  }

  Future<String> cancelUtang({@required String idUtang, @required String pengutang}) async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.post(
        '$baseApiUtang/cancelUtang',
        body: {
          'id_utang': '$idUtang',
          'pengutang': '$pengutang',
        },
      ).timeout(Duration(seconds: 30), onTimeout: () => throw ConstText.TIMEOUT_EXCEPTION);
      final Map<String, dynamic> responseJson = json.decode(response.body);
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
