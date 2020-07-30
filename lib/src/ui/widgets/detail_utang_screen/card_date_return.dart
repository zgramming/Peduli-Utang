import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/global_provider.dart';

import '../../../network/models/models.dart';

class CardDateReturn extends StatelessWidget {
  final UtangModel model;
  CardDateReturn({@required this.model});
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final remainingDay = model.tglKembali.difference(now).inDays;
    final remainingHour = model.tglKembali.difference(now).inHours;
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Text(
                  '${GlobalFunction().formatYearMonthDay(model.createdDate, type: 2)}',
                  style: appTheme.subtitle1(context),
                ),
              ),
              Flexible(
                child: Divider(
                  color: colorPallete.black,
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                ),
              ),
              Flexible(
                flex: 2,
                child: Text('${GlobalFunction().formatYearMonthDay(model.tglKembali, type: 2)}',
                    style: appTheme.subtitle1(context)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Consumer((ctx, read) {
            final globalState = read(globalStateNotifierProvider.state);
            return RichText(
              text: TextSpan(
                children: [
                  if (remainingDay > 0) ...[
                    TextSpan(
                      text: ' $remainingDay',
                      style: appTheme.headline2(context).copyWith(
                            fontFamily: 'Righteous',
                            fontWeight: FontWeight.bold,
                            color: globalState.isDarkMode ? colorPallete.white : colorPallete.black,
                          ),
                    ),
                    TextSpan(text: 'hari lagi', style: appTheme.bodyText1(context))
                  ] else ...[
                    TextSpan(
                      text: ' $remainingHour',
                      style: appTheme.headline2(context).copyWith(
                            fontFamily: 'Righteous',
                            fontWeight: FontWeight.bold,
                            color: globalState.isDarkMode ? colorPallete.white : colorPallete.black,
                          ),
                    ),
                    TextSpan(text: 'jam lagi', style: appTheme.bodyText1(context)),
                  ]
                ],
              ),
            );
          }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
