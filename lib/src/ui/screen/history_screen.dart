import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:peduli_utang/src/providers/global_provider.dart';

import '../../network/models/models.dart';

class HistoryScreen extends StatelessWidget {
  static const routeNamed = '/history-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Aktifitas'),
      ),
      body: SizedBox(
        height: sizes.screenHeightMinusAppBarMinusStatusBar(context),
        child: Consumer((ctx, read) {
          final history = read(futureHistoryByUser);
          return history.when(
            data: (value) {
              if (value.isEmpty) {
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Belum ada riwayat utang',
                    style: appTheme.headline6(context),
                  ),
                );
              }
              return GroupedListView<HistoryModel, String>(
                elements: value,
                groupBy: (element) => element.kodeAksi,
                groupSeparatorBuilder: (value) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: colorPallete.grey),
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: 'Kode Aksi : ',
                        children: [
                          TextSpan(
                              text: value,
                              style: appTheme.headline4(context).copyWith(color: colorPallete.blue))
                        ],
                      ),
                      style: appTheme.subtitle1(context),
                    ),
                  ),
                ),
                indexedItemBuilder: (context, element, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text(element.kodeAksi),
                        ),
                      ),
                      title: Text(element.namaAksi),
                      subtitle: Text(
                        '${GlobalFunction().formatYearMonthDaySpecific(element.createdDate)} ${GlobalFunction().formatHoursMinutes(element.createdDate)}',
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text(
                error.toString(),
              ),
            ),
          );
        }),
      ),
    );
  }
}
