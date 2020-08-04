import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../providers/global_provider.dart';

class PengutangScreen extends StatelessWidget {
  static const routeNamed = '/pengutang-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sebagai Pengutang'),
      ),
      body: Consumer((ctx, read) {
        final utang = read(utangByPengutang);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Daftar Utang Kamu',
                style: appTheme.headline6(context),
              ),
            ),
            if (utang.isEmpty) ...[
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Kamu tidak punya utang'),
                ),
              ),
            ] else ...[
              Expanded(
                child: ListWheelScrollView(
                  itemExtent: sizes.height(context) / 6,
                  children: [
                    ...utang.map(
                      (e) {
                        final now = DateTime.now();
                        final remainingDay = e.tglKembali.difference(now).inDays;
                        final remainingHour = e.tglKembali.difference(now).inHours;
                        return SizedBox(
                          width: sizes.width(context),
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: ShowImageNetwork(
                                  imageUrl: e.pembertang.imageUser,
                                  isCircle: true,
                                  fit: BoxFit.cover,
                                  imageCircleRadius: 25,
                                ),
                                // title: Text(e.sisaUtang.toString()),
                                title: Text('Rp.${GlobalFunction().formatNumber(e.sisaUtang)}'),
                                subtitle: Text(
                                    '${GlobalFunction().formatYearMonthDaySpecific(e.createdDate)} ${GlobalFunction().formatHoursMinutes(e.createdDate)}',
                                    style: appTheme.caption(context)),
                                trailing: CircleAvatar(
                                  backgroundColor: colorPallete.accentColor,
                                  child: FittedBox(
                                    child: Text.rich(
                                      TextSpan(
                                        style: appTheme
                                            .bodyText1(context)
                                            .copyWith(color: colorPallete.white),
                                        children: [
                                          if (remainingDay > 0) ...[
                                            TextSpan(
                                              text: ' $remainingDay',
                                              style: appTheme.headline3(context).copyWith(
                                                    fontFamily: 'Righteous',
                                                    fontWeight: FontWeight.bold,
                                                    color: colorPallete.white,
                                                  ),
                                            ),
                                            TextSpan(text: 'hari')
                                          ] else ...[
                                            TextSpan(
                                              text: ' $remainingHour',
                                              style: appTheme.headline3(context).copyWith(
                                                    fontFamily: 'Righteous',
                                                    fontWeight: FontWeight.bold,
                                                    color: colorPallete.white,
                                                  ),
                                            ),
                                            TextSpan(text: 'jam')
                                          ]
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList()
                  ],
                ),
              ),
            ]
          ],
        );
      }),
    );
  }
}
