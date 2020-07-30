import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/global_provider.dart';

class DialogQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'QR-KU',
        style: appTheme.headline6(context).copyWith(fontWeight: FontWeight.bold),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Consumer((ctx, read) {
              final result = read(userProvider.state);
              return QrImage(
                errorStateBuilder: (context, error) =>
                    Text(error.toString(), style: appTheme.caption(context)),
                data: '${result.idUser}',
                size: sizes.height(context) / 4,
              );
            }),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              textColor: colorPallete.accentColor,
              child: Text('Tutup'),
            ),
          )
        ],
      ),
    );
  }
}
