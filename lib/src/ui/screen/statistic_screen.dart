import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../providers/global_provider.dart';
import '../widgets/statistic_screen/header_statistic.dart';
import '../widgets/statistic_screen/info_statistic.dart';

class StatisticScreen extends StatelessWidget {
  static const routeNamed = '/statistic-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistik'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer((ctx, read) {
            final theBiggestUtang = read(biggestUtang);
            final firstPengutang = read(myFirstPengutang);
            final firstPembertang = read(myFirstPembertang);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20),
                if (firstPengutang == null) ...[
                  Text('Belum ada data pengutang', textAlign: TextAlign.center)
                ] else ...[
                  HeaderStatistic(title: 'Paling Pertama'),
                  const SizedBox(height: 20),
                  InfoStatistic(
                    imageAssetUrl: '${AppConfig.urlImageAsset}/the-first.png',
                    textChildren: [
                      TextSpan(
                        text: '${firstPengutang.pengutang.nameUser} ',
                        style: appTheme.subtitle1(context).copyWith(
                              color: colorPallete.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(text: 'merupakan orang pertama yang meminta utang kepadamu')
                    ],
                  ),
                ],
                const SizedBox(height: 20),
                if (firstPembertang == null) ...[
                  Text('Belum ada data Pemberi Utang', textAlign: TextAlign.center)
                ] else ...[
                  InfoStatistic(
                    imageAssetUrl: '${AppConfig.urlImageAsset}/the-first.png',
                    textChildren: [
                      TextSpan(
                        text: '${firstPembertang.pembertang.nameUser} ',
                        style: appTheme.subtitle1(context).copyWith(
                              color: colorPallete.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(text: 'orang pertama yang kamu mintai utang')
                    ],
                    position: Position.RIGHT,
                  ),
                ],
                const SizedBox(height: 20),
                if (theBiggestUtang == null) ...[
                  Text('Belum ada data utang terbanyak', textAlign: TextAlign.center)
                ] else ...[
                  HeaderStatistic(title: 'Paling Banyak'),
                  const SizedBox(height: 20),
                  InfoStatistic(
                    imageAssetUrl: '${AppConfig.urlImageAsset}/the-most.png',
                    textChildren: [
                      TextSpan(
                        text: '${theBiggestUtang.key} ',
                        style: appTheme.subtitle1(context).copyWith(
                              color: colorPallete.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(text: 'meminta utang sebanyak '),
                      TextSpan(
                        text: '${theBiggestUtang.value} ',
                        style: appTheme.subtitle1(context).copyWith(
                              color: colorPallete.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(text: 'kali'),
                    ],
                  ),
                ],
                const SizedBox(height: 20),
                HeaderStatistic(title: 'Paling Dermawan'),
                const SizedBox(height: 20),
                Consumer((ctx, read) {
                  final futureHistory = read(futureHistoryByUser);
                  final totalIkhlaskan = read(totalIkhlaskanHistory);
                  return futureHistory.when(
                    loading: () => Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    data: (_) => InfoStatistic(
                        imageAssetUrl: '${AppConfig.urlImageAsset}/the-generous.png',
                        position: Position.RIGHT,
                        textChildren: [
                          TextSpan(text: 'kamu sudah '),
                          TextSpan(
                            text: '$totalIkhlaskan ',
                            style: appTheme.headline6(context).copyWith(
                                  color: colorPallete.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(text: 'kali meng-ikhlaskan utang teman kamu')
                        ]),
                  );
                }),
                const SizedBox(height: 20),
              ],
            );
          }),
        ),
      ),
    );
  }
}
