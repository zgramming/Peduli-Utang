import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../../../network/models/models.dart';

import '../../screen/detail_utang_screen.dart';

import '../dialog_ikhlaskan.dart';
import '../modalbottomsheet_cicil.dart';

class DetailSearchingList extends StatelessWidget {
  DetailSearchingList({@required this.detailMap});
  final MapEntry<int, UtangModel> detailMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorPallete.black.withOpacity(.25),
          ),
        ),
      ),
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed(
          DetailUtangScreen.routeNamed,
          arguments: detailMap.value,
        ),
        leading: CircleAvatar(
          backgroundColor: colorPallete.primaryColor,
          foregroundColor: colorPallete.white,
          radius: 15,
          child: Text('${detailMap.key + 1}'),
        ),
        title: Text(
          'Rp.${GlobalFunction().formatNumber(detailMap.value.sisaUtang)}',
          style: appTheme.bodyText1(context).copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${GlobalFunction().formatYearMonthDay(detailMap.value.tglKembali, type: 3)} ${GlobalFunction().formatHoursMinutes(detailMap.value.tglKembali)}',
          style: appTheme.caption(context),
        ),
        trailing: Wrap(
          spacing: 10,
          children: <Widget>[
            InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (ctx) => DialogIkhlaskan(model: detailMap.value),
              ),
              child: CircleAvatar(
                backgroundColor: colorPallete.accentColor,
                foregroundColor: colorPallete.white,
                radius: 15,
                child: Icon(Icons.outlined_flag),
              ),
            ),
            InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (ctx) => ModalBottomSheetCicil(model: detailMap.value),
              ),
              child: CircleAvatar(
                backgroundColor: colorPallete.blue,
                foregroundColor: colorPallete.white,
                radius: 15,
                child: Icon(Icons.mode_edit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
