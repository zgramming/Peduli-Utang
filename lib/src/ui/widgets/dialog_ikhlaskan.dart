import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../network/models/models.dart';
import '../../providers/global_provider.dart';

class DialogIkhlaskan extends StatelessWidget {
  final UtangModel model;

  DialogIkhlaskan({this.model});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Kamu yakin ? ',
        style: appTheme.headline6(context).copyWith(fontWeight: FontWeight.bold),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Setelah menekan setuju , utang ${model.pengutang.nameUser} akan dianggap lunas dan tidak bisa dibatalkan.',
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Spacer(),
              Consumer((ctx, read) {
                final globalState = read(globalStateNotifierProvider.state);
                if (globalState.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return OutlineButton(
                  onPressed: () async {
                    try {
                      globalStateNotifierProvider.read(context).toggleLoading(true);
                      final result =
                          await utangProvider.read(context).ikhlaskanUtang(idUtang: model.idUtang);
                      globalStateNotifierProvider.read(context).toggleLoading(false);
                      await GlobalFunction().showToast(message: result, isSuccess: true);
                      Navigator.of(context).pop();
                    } catch (e) {
                      globalStateNotifierProvider.read(context).toggleLoading(false);
                      await GlobalFunction().showToast(message: e.toString(), isError: true);
                    }
                  },
                  child: Text('Setuju'),
                  borderSide: BorderSide(
                    color: colorPallete.primaryColor,
                  ),
                  textColor: colorPallete.primaryColor,
                );
              }),
              const SizedBox(width: 10),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Batal',
                  style: appTheme
                      .button(context)
                      .copyWith(fontWeight: FontWeight.bold, color: colorPallete.white),
                ),
                color: colorPallete.red,
                textTheme: ButtonTextTheme.primary,
              ),
            ],
          )
        ],
      ),
    );
  }
}
