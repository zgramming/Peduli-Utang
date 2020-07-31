import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/global_provider.dart';

import '../widgets/searching_screen/searching_detail_list.dart';

class SearchingScreen extends StatefulWidget {
  @override
  _SearchingScreenState createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  @override
  Widget build(BuildContext context) {
    // print('SearchingScreen Rebuild Because Keyboard OpenUp');
    return SizedBox(
      height: sizes.screenHeightMinusStatusBar(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            TextFormFieldCustom(
              onSaved: (value) => '',
              onChanged: (value) => queryFilter.read(context).state = value,
              prefixIcon: Icon(Icons.search),
              hintText: 'Cari...',
            ),
            const SizedBox(height: 20),
            Text(
              'Daftar Peminjam',
              style: appTheme.subtitle1(context),
            ),
            const SizedBox(height: 20),
            Consumer(
              (ctx, read) {
                final filterList = read(showFilteredList);
                if (filterList.values.isEmpty) {
                  return Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Daftar peminjam tidak ditemukan'),
                    ),
                  );
                }
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: filterList
                          .map(
                            (key, value) {
                              final allUtang = read(totalRemainingUtang(key));
                              final userWithAllUtang = read(userWithTotalRemainingUtang(key));
                              return MapEntry(
                                key,
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                                    child: ExpansionTile(
                                      title: Text(userWithAllUtang.pengutang.nameUser),
                                      leading: ShowImageNetwork(
                                        imageUrl: userWithAllUtang.pengutang.imageUser,
                                        isCircle: true,
                                        fit: BoxFit.cover,
                                        imageCircleRadius: 25,
                                      ),
                                      subtitle: Text.rich(
                                        TextSpan(
                                          text: 'Total : ',
                                          children: [
                                            TextSpan(
                                              text: 'Rp.${GlobalFunction().formatNumber(allUtang)}',
                                              style: appTheme
                                                  .bodyText2(context)
                                                  .copyWith(fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      children: value
                                          .asMap()
                                          .entries
                                          .map(
                                            (detailMap) => DetailSearchingList(
                                              detailMap: detailMap,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                          .values
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: sizes.statusBarHeight(context) * 4),
          ],
        ),
      ),
    );
  }
}
