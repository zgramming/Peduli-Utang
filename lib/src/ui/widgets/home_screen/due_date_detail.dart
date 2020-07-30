import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../../../network/models/models.dart';

class DueDateDetail extends StatelessWidget {
  final UtangModel model;

  DueDateDetail({@required this.model});
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final remainingDay = model.tglKembali.difference(now).inDays;
    final remainingHour = model.tglKembali.difference(now).inHours;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Rp.${GlobalFunction().formatNumber(model.sisaUtang)}',
                style: appTheme.headline6(context).copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            style: appTheme.bodyText1(context),
            children: [
              if (remainingDay > 0) ...[
                TextSpan(
                  text: ' $remainingDay',
                  style: appTheme.headline3(context).copyWith(
                        fontFamily: 'Righteous',
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(text: 'hari')
              ] else ...[
                TextSpan(
                  text: ' $remainingHour',
                  style: appTheme.headline3(context).copyWith(
                        fontFamily: 'Righteous',
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(text: 'jam')
              ]
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
