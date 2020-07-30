import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../../../network/models/models.dart';

import '../modalbottomsheet_cicil.dart';
import '../dialog_ikhlaskan.dart';

class DueDateAction extends StatelessWidget {
  DueDateAction({@required this.model});

  final UtangModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: SizedBox(
              height: sizes.height(context) / 25,
              child: OutlineButton(
                padding: const EdgeInsets.all(6.0),
                borderSide: BorderSide(color: colorPallete.accentColor),
                onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => DialogIkhlaskan(model: model),
                ),
                child: FittedBox(
                  child: Text(
                    'IKHLASKAN',
                    style: appTheme.button(context).copyWith(
                          color: colorPallete.accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            fit: FlexFit.tight,
          ),
          SizedBox(width: 10),
          Flexible(
            child: SizedBox(
              height: sizes.height(context) / 25,
              child: RaisedButton(
                padding: const EdgeInsets.all(6.0),
                color: colorPallete.blue,
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (ctx) => ModalBottomSheetCicil(model: model),
                ),
                child: FittedBox(
                  child: Text(
                    'CICIL',
                    style: appTheme.button(context).copyWith(
                          color: colorPallete.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            fit: FlexFit.tight,
          ),
        ],
      ),
    );
  }
}
