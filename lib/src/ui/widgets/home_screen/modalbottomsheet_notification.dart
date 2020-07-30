import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/global_provider.dart';

import './list_utang_need_confirm.dart';

class ModalBottomSheetNotification extends StatelessWidget {
  const ModalBottomSheetNotification({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizes.screenHeightMinusStatusBar(context) - sizes.height(context) / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
            child: Text(
              'Konfirmasi Permintaan ',
              style: appTheme.subtitle1(context).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: sizes.height(context) / 1.5,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Consumer((ctx, read) {
                      final utangFuture = read(showUtangByPembertang);
                      final utang = read(unConfirmUtangList);
                      final globalState = read(globalStateNotifierProvider.state);
                      return utangFuture.when(
                        data: (_) {
                          if (utang.isEmpty) {
                            return Center(child: Text('Permintaan konfirmasi kosong'));
                          } else {
                            if (globalState.isLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListUtangNeedConfirm(
                                utangNotConfirm: utang,
                                ctx: ctx,
                              );
                            }
                          }
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, stackTrace) => Text(error.toString()),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
