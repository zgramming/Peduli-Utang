import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class CardTotalAndRemainingUtang extends StatelessWidget {
  final String title;
  final String content;
  final Color textColor;
  final Color colorDivider;
  final Color cardColor;
  final double thicknessDivider;
  final bool titleIsBold;
  CardTotalAndRemainingUtang({
    @required this.title,
    @required this.content,
    this.cardColor,
    this.textColor,
    this.colorDivider,
    this.thicknessDivider = .75,
    this.titleIsBold = false,
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              title,
              style: appTheme.subtitle1(context).copyWith(
                    color: textColor,
                    fontWeight: titleIsBold ? FontWeight.bold : FontWeight.normal,
                  ),
            ),
            Divider(
              color: colorDivider,
              thickness: thicknessDivider,
              indent: sizes.width(context) / 20,
              endIndent: sizes.width(context) / 20,
            ),
            Expanded(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    content,
                    style: appTheme.headline5(context).copyWith(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      fit: FlexFit.tight,
    );
  }
}
