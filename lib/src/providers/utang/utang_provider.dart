import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../global_provider.dart';
import '../../network/apis/apis.dart';
import '../../network/models/models.dart';

class UtangProvider extends StateNotifier<List<UtangModel>> {
  UtangProvider([List<UtangModel> state]) : super(state ?? []);

  final utangApi = UtangApi();

  //! Pertama Kali , Ambil semua utang berdasarkan ID User
  Future<List<UtangModel>> showAllUtangUser(String idUser) async {
    final utangByPembertang = await utangApi.getUtang(idUser, sebagaiApa: 'pembertang');
    final utangByPengutang = await utangApi.getUtang(idUser, sebagaiApa: 'pengutang');
    var tempList = [...utangByPembertang, ...utangByPengutang];
    state = [...tempList];
    print('showAllUtangUser ${state.length}');
    return tempList;
  }

  Future<List<UtangModel>> getUtang(
    String idUser, {
    String sebagaiApa,
    bool showOnlyUnconfirm = false,
    bool showOnlyConfirm = false,
  }) async {
    final result = await utangApi.getUtang(idUser, sebagaiApa: sebagaiApa);

    final filter = result
        .where((element) => element.status == '1' && element.pengutang.idUser != idUser)
        .toList();
    final groupFilter = groupBy<UtangModel, String>(filter, (obj) => obj.pengutang.idUser);
    print(groupFilter.toString());
    // state = [...result];
    if (showOnlyConfirm) {
      return result.where((element) => element.status == '1').toList();
    } else if (showOnlyUnconfirm) {
      return result.where((element) => element.status == '0').toList();
    } else {
      return result;
    }
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
    final result = await utangApi.addUtang(
      pembertang: pembertang,
      pengutang: pengutang,
      totalUtang: totalUtang,
      tglKembali: tglKembali,
      keterangan: keterangan,
      ttd: ttd,
      selfieImage: selfieImage,
    );
    return result;
  }

  void addNewUtangRequest(List<UtangModel> value) {
    var tempList = [];
    if (value.isNotEmpty) {
      for (var newItem in value) {
        final existItem =
            state.firstWhere((element) => element.idUtang == newItem.idUtang, orElse: () => null);
        if (existItem == null) {
          tempList.add(newItem);
        }
      }
    }
    state = [...state, ...tempList];
  }

  Future<String> cicilUtang({
    @required String idUtang,
    @required String pembertang,
    @required int totalCicil,
  }) async {
    final result = await utangApi.cicilUtang(
      idUtang: idUtang,
      pembertang: pembertang,
      totalCicil: totalCicil,
    );
    state = [
      for (final item in state)
        if (item.idUtang == idUtang.toString())
          item.copyWith(sisaUtang: item.sisaUtang - totalCicil)
        else
          item
    ];
    return result;
  }

  Future<String> ikhlaskanUtang({
    @required String idUtang,
  }) async {
    final result = await utangApi.ikhlaskanUtang(idUtang: idUtang);
    var tempList = [...state];

    tempList.removeWhere((element) => element.idUtang == idUtang);
    state = [...tempList];
    return result;
  }

  Future<String> confirmUtang({@required String idUtang, @required String pengutang}) async {
    final result = await utangApi.confirmUtang(idUtang: idUtang, pengutang: pengutang);
    state = [
      for (final item in state) if (item.idUtang == idUtang) item.copyWith(status: '1') else item
    ];
    return result;
  }

  Future<String> cancelUtang({@required String idUtang, @required String pengutang}) async {
    var tempList = [...state];
    final result = await utangApi.cancelUtang(idUtang: idUtang, pengutang: pengutang);
    tempList.removeWhere((element) => element.idUtang == idUtang);
    state = tempList;
    return result;
  }
}

final utangProvider = StateNotifierProvider((ref) => UtangProvider());

final showUtangUser = FutureProvider.autoDispose((ref) async {
  final user = ref.read(userProvider);
  final utang = ref.read(utangProvider);
  final result = await utang.showAllUtangUser(user.initialState.idUser);
  return result;
});

final showUtangByPembertang = FutureProvider.autoDispose(
  (ref) async {
    final user = ref.read(userProvider);
    final utang = ref.read(utangProvider);
    final result = await utang.getUtang(
      user.initialState.idUser,
      sebagaiApa: 'pembertang',
      showOnlyUnconfirm: true,
    );
    utang.addNewUtangRequest(result);
    return result;
  },
);

final utangByPengutang = Provider<List<UtangModel>>((ref) {
  final utang = ref.watch(utangProvider.state);
  final user = ref.watch(userProvider.state);
  final result = utang
      .where((element) => element.status == '1' && element.pembertang.idUser != user.idUser)
      .toList();
  return result;
});

final unConfirmUtangList = Provider<List<UtangModel>>((ref) {
  final utang = ref.watch(utangProvider.state);
  return utang.where((element) => element.status == '0').toList();
});

final totalYourUtang = Provider<int>((ref) {
  final utang = ref.watch(utangProvider.state);
  final user = ref.watch(userProvider.state);
  return utang
      .where((element) => element.pengutang.idUser == user.idUser && element.status == '1')
      .toList()
      .length;
});

final totalTheirUtang = Provider<int>((ref) {
  final utang = ref.watch(utangProvider.state);
  final user = ref.watch(userProvider.state);
  var tempList = [...utang];

  return tempList
      .where((element) => element.pengutang.idUser != user.idUser && element.status == '1')
      .toList()
      .length;
});

final deadlineUtang = Provider<List<UtangModel>>((ref) {
  final utang = ref.watch(utangProvider.state);
  final user = ref.watch(userProvider.state);

  var tempList = [...utang];
  tempList.sort((first, end) => first.tglKembali.compareTo(end.tglKembali));
  return tempList
      .where((element) => element.status == '1' && element.pengutang.idUser != user.idUser)
      .toList();
});

final showFilteredList = Provider<Map<String, List<UtangModel>>>((ref) {
  final utang = ref.watch(utangProvider.state);
  final user = ref.watch(userProvider.state);
  final query = ref.watch(queryFilter);
  var tempList = [...utang];

  final resultFilter = tempList
      .where(
        (element) =>
            element.pengutang.nameUser.toLowerCase().contains(query.state.toLowerCase()) &&
            element.status == '1' &&
            element.pengutang.idUser != user.idUser,
      )
      .toList();
  final groupFilter = groupBy<UtangModel, String>(resultFilter, (obj) => obj.pengutang.idUser);
  return groupFilter;
});

final totalAllUtang = Provider.family<int, String>((ref, param) {
  final utang = ref.watch(utangProvider.state);
  var tempList = [...utang];

  final resultFilter = tempList
      .where((element) => element.status == '1' && element.pengutang.idUser == param)
      .toList();

  var total = resultFilter.fold(0, (previousValue, element) => previousValue + element.totalUtang);

  return total;
});

final totalRemainingUtang = Provider.family<int, String>((ref, param) {
  final utang = ref.watch(utangProvider.state);
  var tempList = [...utang];

  final resultFilter = tempList
      .where((element) => element.status == '1' && element.pengutang.idUser == param)
      .toList();

  var total = resultFilter.fold(0, (previousValue, element) => previousValue + element.sisaUtang);

  return total;
});

final userWithTotalRemainingUtang = Provider.family<UtangModel, String>((ref, param) {
  final utang = ref.watch(utangProvider.state);
  var tempList = [...utang];
  final result = tempList.firstWhere((element) => element.pengutang.idUser == param,
      orElse: () => UtangModel());
  return result;
});

// ! Query Filter get from TextEditingController
final queryFilter = StateProvider((ref) => '');
