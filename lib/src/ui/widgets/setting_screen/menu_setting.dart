import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class MenuSetting extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color iconColor;
  final Widget trailing;
  final Widget leading;
  MenuSetting({
    @required this.onTap,
    @required this.title,
    this.subtitle = '',
    this.leading,
    this.icon,
    this.trailing,
    this.backgroundColor,
    this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // color: colorPallete.blue,
        height: sizes.height(context) / 9,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: sizes.width(context) / 18,
              child: icon != null
                  ? Icon(
                      icon,
                    )
                  : leading,
              backgroundColor: backgroundColor ?? colorPallete.accentColor,
              foregroundColor: iconColor ?? colorPallete.white,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Expanded(child: Text('data')),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      title,
                                      style: appTheme.subtitle1(context),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  subtitle,
                                  style: appTheme.caption(context),
                                )
                              ],
                            ),
                          ),
                          trailing ?? SizedBox()
                        ],
                      ),
                    ),
                    Divider(color: colorPallete.greyTransparent, thickness: 1.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
