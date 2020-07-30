import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../providers/global_provider.dart';
import '../../network/models/models.dart';
import '../../network/apis/apis.dart';

class HistoryProvider extends StateNotifier<List<HistoryModel>> {
  HistoryProvider([List<HistoryModel> state]) : super(state ?? []);
  final HistoryApi historyApi = HistoryApi();

  Future<List<HistoryModel>> getHistoryByUser({@required String idUser}) async {
    final result = await historyApi.getHistoryByUser(idUser: idUser);
    state = [...result];
    return result;
  }
}

final historyProvider = StateNotifierProvider((ref) => HistoryProvider());

final futureHistoryByUser = FutureProvider.autoDispose((ref) async {
  final history = ref.read(historyProvider);
  final user = ref.read(userProvider);
  final result = await history.getHistoryByUser(idUser: user.initialState.idUser);
  print('result history future ${result.length} || user : ${user.initialState.idUser}');
  return result;
});

final totalIkhlaskanHistory = Computed<int>((read) {
  final user = read(userProvider.state);
  final history = read(historyProvider.state);
  final result = history
      .where((element) => element.kodeAksi == 'IKH' && element.idUser.idUser == user.idUser)
      .toList()
      .length;
  return result;
});

//! For Statistic Screen

final biggestUtang = Computed<MapEntry<String, int>>((read) {
  final utang = read(utangProvider.state);
  final user = read(userProvider.state);
  final result = utang
      .where((element) => element.status == '1' && element.pembertang.idUser == user.idUser)
      .toList();
  if (result.isEmpty) {
    return null;
  }
  final mapResult = result.fold(
    <String, int>{},
    (Map<String, int> fold, element) => fold
      ..update(
        element.pengutang.nameUser,
        (value) => value + 1,
        ifAbsent: () => 1,
      ),
  );
  print(mapResult);
  final biggest = mapResult.entries.reduce((a, b) => a.value > b.value ? a : b);
  return biggest;
});

final myFirstPembertang = Computed<UtangModel>((read) {
  final utang = read(utangProvider.state);
  final user = read(userProvider.state);
  final result = utang.where((element) => element.pembertang.idUser != user.idUser).toList();
  if (result.isEmpty) {
    return null;
  }
  result.sort((a, b) => a.createdDate.compareTo(b.createdDate));
  return result.first;
});

final myFirstPengutang = Computed<UtangModel>((read) {
  final utang = read(utangProvider.state);
  final user = read(userProvider.state);
  final result = utang.where((element) => element.pengutang.idUser != user.idUser).toList();
  if (result.isEmpty) {
    return null;
  }
  result.sort((a, b) => a.createdDate.compareTo(b.createdDate));
  return result.first;
});

//! Close For Statistic Screen
