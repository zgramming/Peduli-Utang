import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/profil_info.dart';
import '../widgets/detail_utang_screen/card_total_and_remaining.dart';
import '../widgets/detail_utang_screen/card_date_return.dart';

import '../../providers/global_provider.dart';
import '../../network/models/models.dart';

class DetailUtangScreen extends StatelessWidget {
  final UtangModel model;
  DetailUtangScreen(this.model);
  static const routeNamed = '/detail-utang';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Utang'),
      ),
      body: Stack(
        children: <Widget>[
          Container(height: sizes.screenHeightMinusAppBar(context)),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
                  child: ProfilInfo(
                    email: model.pengutang.emailUser,
                    username: model.pengutang.nameUser,
                    photo: model.pengutang.imageUser,
                  ),
                ),
                Container(
                  height: sizes.height(context) / 4,
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer((ctx, read) {
                    final totalUtang = read(totalAllUtang(model.pengutang.idUser));
                    final remainingUtang = read(totalRemainingUtang(model.pengutang.idUser));
                    return Row(
                      children: <Widget>[
                        CardTotalAndRemainingUtang(
                          title: 'Total',
                          content: 'Rp.${GlobalFunction().formatNumber(totalUtang)}',
                        ),
                        CardTotalAndRemainingUtang(
                          title: 'Sisa',
                          content: 'Rp.${GlobalFunction().formatNumber(remainingUtang)}',
                          cardColor: colorPallete.accentColor,
                          colorDivider: colorPallete.white,
                          titleIsBold: true,
                          textColor: colorPallete.white,
                          thicknessDivider: 1.5,
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tanggal Pengembalian',
                    style: appTheme.subtitle1(context),
                  ),
                ),
                const SizedBox(height: 10),
                CardDateReturn(model: model),
                SizedBox(height: sizes.height(context) * 0.1),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: DraggableDetailUtang(model: model),
          )
        ],
      ),
    );
  }
}

class DraggableDetailUtang extends StatelessWidget {
  const DraggableDetailUtang({
    Key key,
    @required this.model,
  }) : super(key: key);

  final UtangModel model;

  @override
  Widget build(BuildContext context) {
    final decodeTTD = base64Decode(model.ttd);
    return Consumer((ctx, read) {
      final globalState = read(globalStateNotifierProvider.state);
      return DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: globalState.isDarkMode ? colorPallete.darkGreyAccent3 : colorPallete.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: colorPallete.black.withOpacity(.5),
                  blurRadius: 4,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: sizes.width(context) / 3.5),
                      height: 10,
                      decoration: BoxDecoration(
                        color: colorPallete.primaryColor,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    SizedBox(height: sizes.height(context) * 0.1),
                    Text('Tanda Tangan',
                        style: appTheme.headline4(context), textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    Card(
                      child: Image.memory(
                        decodeTTD,
                        color: colorPallete.accentColor,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
