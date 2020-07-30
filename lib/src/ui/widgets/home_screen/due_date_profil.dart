import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../../../network/models/models.dart';

class DueDateProfil extends StatelessWidget {
  final UtangModel model;
  DueDateProfil({@required this.model});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ShowImageNetwork(
          imageUrl: '${appConfig.baseImageApiUtangUrl}/${model.selfie}',
          isCircle: true,
          imageCircleRadius: 20,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            model.pengutang.nameUser,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTheme.caption(context).copyWith(
                // color: colorPallete.black.withOpacity(.8),
                ),
          ),
        ),
      ],
    );
  }
}
