import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:global_template/global_template.dart';

class StepsInformation extends StatelessWidget {
  final TextEditingController nominalController;
  final TextEditingController reasonController;
  final Function onPickedDateTime;
  final DateTime pickedDateTime;
  StepsInformation({
    @required this.nominalController,
    @required this.reasonController,
    @required this.onPickedDateTime,
    @required this.pickedDateTime,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Informasi',
          style: appTheme.headline6(context).copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormFieldCustom(
          controller: nominalController,
          onSaved: (value) => '',
          labelText: 'Nominal',
          disableOutlineBorder: true,
          prefixIcon: Icon(
            Icons.payment,
          ),
          keyboardType: TextInputType.number,
          inputFormatter: [
            InputNumberFormat(),
          ],
        ),
        const SizedBox(height: 10),
        TextFormFieldCustom(
          controller: reasonController,
          onSaved: (value) => '',
          hintText: 'Sebutkan Alasan Kenapa Berutang',
          labelText: 'Alasan',
          maxLines: 3,
          prefixIcon: Icon(Icons.info),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
        ),
        const SizedBox(height: 20),
        Text(
          'Tanggal Pengembalian',
          style: appTheme.subtitle1(context),
        ),
        const SizedBox(height: 20),
        OutlineButton(
          onPressed: () => DatePicker.showDatePicker(
            context,
            currentTime: DateTime.now(),
            locale: LocaleType.id,
            minTime: DateTime.now(),
            showTitleActions: true,
            onConfirm: (time) {
              final now = DateTime.now();
              final combineDateTime = time.add(
                Duration(hours: now.hour, minutes: now.minute, seconds: now.second),
              );
              onPickedDateTime(combineDateTime);
            },
          ),
          child: Text(
            pickedDateTime == null
                ? 'Pilih Tanggal'
                : GlobalFunction().formatYearMonthDaySpecific(pickedDateTime),
            style: appTheme
                .button(context)
                .copyWith(color: colorPallete.accentColor, fontWeight: FontWeight.bold),
          ),
          borderSide: BorderSide(color: colorPallete.accentColor),
          textColor: colorPallete.accentColor,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
