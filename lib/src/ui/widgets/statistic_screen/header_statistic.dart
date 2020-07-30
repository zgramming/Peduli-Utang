import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class HeaderStatistic extends StatelessWidget {
  final String title;
  HeaderStatistic({@required this.title}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorPallete.grey),
        ),
      ),
      child: Text(
        title,
        style: appTheme.headline6(context),
      ),
    );
  }
}
