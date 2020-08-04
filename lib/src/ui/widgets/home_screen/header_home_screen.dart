import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../providers/global_provider.dart';
import '../../screen/pengutang_screen.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizes.width(context) / 15),
      decoration: BoxDecoration(
        color: colorPallete.primaryColor,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top + 10),
          Text(
            'Sebagai Pemberi Utang',
            style: appTheme.headline6(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            children: <Widget>[
              Text(
                'Utang Kamu',
                style: appTheme.subtitle1(context).copyWith(color: colorPallete.white),
              ),
              Consumer((ctx, read) {
                final utang = read(totalYourUtang);
                return InkWell(
                  onTap: () async =>
                      await Navigator.of(context).pushNamed(PengutangScreen.routeNamed),
                  child: Text(
                    '$utang',
                    style: appTheme.headline3(context).copyWith(
                        color: colorPallete.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Righteous',
                        decoration: TextDecoration.underline),
                  ),
                );
              }),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Row(
            children: <Widget>[
              Text(
                'Utang Mereka',
                style: appTheme.subtitle1(context).copyWith(color: colorPallete.white),
              ),
              Consumer(
                (ctx, read) {
                  final utang = read(totalTheirUtang);
                  return Text(
                    '$utang',
                    style: appTheme.headline3(context).copyWith(
                          color: colorPallete.white,
                          fontFamily: 'Righteous',
                        ),
                  );
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
