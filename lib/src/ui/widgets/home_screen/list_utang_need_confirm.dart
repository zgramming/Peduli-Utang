import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../network/models/models.dart';
import '../../../providers/global_provider.dart';

class ListUtangNeedConfirm extends StatelessWidget {
  const ListUtangNeedConfirm({
    Key key,
    @required this.utangNotConfirm,
    this.ctx,
  }) : super(key: key);

  final List<UtangModel> utangNotConfirm;
  final BuildContext ctx;
  static const sizeIcon = 15.0;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<UtangModel, String>(
      elements: utangNotConfirm,
      groupBy: (element) => element.pengutang.nameUser,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      groupSeparatorBuilder: (value) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colorPallete.grey),
          ),
        ),
        child: Text(
          value,
          style: appTheme.subtitle1(context),
        ),
      ),
      indexedItemBuilder: (_, element, __) {
        return Card(
          child: ListTile(
            leading: ShowImageNetwork(
              imageUrl: '${appConfig.baseImageApiUtangUrl}/${element.selfie}',
              isCircle: true,
              imageCircleRadius: 20,
              fit: BoxFit.cover,
            ),
            title: Text(
              GlobalFunction().formatYearMonthDaySpecific(element.createdDate),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: appTheme.caption(context),
            ),
            subtitle: FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                child: Text(
                  'Rp.${GlobalFunction().formatNumber(element.totalUtang.toInt())}',
                  style: appTheme.subtitle2(context).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            trailing: Wrap(
              spacing: 12,
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    try {
                      ctx.read(globalStateNotifierProvider).toggleLoading(true);
                      print('proses cancel');
                      final result = await context.read(utangProvider).cancelUtang(
                            idUtang: element.idUtang,
                            pengutang: element.pengutang.idUser,
                          );
                      print('selesai cancel');

                      await GlobalFunction().showToast(
                        message: result,
                        backgroungColor: colorPallete.accentColor,
                        toastPositioned: ToastPositioned.Center,
                      );
                      ctx.read(globalStateNotifierProvider).toggleLoading(false);
                    } catch (e) {
                      ctx.read(globalStateNotifierProvider).toggleLoading(false);
                      await GlobalFunction().showToast(
                        message: e.toString(),
                        isError: true,
                        toastPositioned: ToastPositioned.Center,
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: sizeIcon,
                    backgroundColor: colorPallete.red,
                    foregroundColor: colorPallete.white,
                    child: Icon(Icons.close, size: sizeIcon),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      ctx.read(globalStateNotifierProvider).toggleLoading(true);
                      final result = await context.read(utangProvider).confirmUtang(
                          idUtang: element.idUtang, pengutang: element.pengutang.idUser);
                      await GlobalFunction().showToast(
                        message: result,
                        isSuccess: true,
                        toastPositioned: ToastPositioned.Center,
                      );
                      ctx.read(globalStateNotifierProvider).toggleLoading(false);
                    } catch (e) {
                      ctx.read(globalStateNotifierProvider).toggleLoading(false);
                      await GlobalFunction().showToast(
                        message: e.toString(),
                        isError: true,
                        toastPositioned: ToastPositioned.Center,
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: sizeIcon,
                    backgroundColor: colorPallete.primaryColor,
                    foregroundColor: colorPallete.white,
                    child: Icon(Icons.done, size: sizeIcon),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
