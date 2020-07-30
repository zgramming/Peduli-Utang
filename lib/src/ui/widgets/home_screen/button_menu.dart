import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class ButtonMenu extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final bool isComingSoon;
  final Color backgroundColor;
  final Color iconColor;
  ButtonMenu({
    @required this.onTap,
    this.icon = Icons.add_circle_outline,
    this.isComingSoon = false,
    this.backgroundColor,
    this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isComingSoon
          ? () => GlobalFunction().showToast(
              message: 'Segera Hadir',
              backgroungColor: colorPallete.accentColor,
              toastPositioned: ToastPositioned.Center)
          : onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: colorPallete.black.withOpacity(.5),
              blurRadius: 2,
            ),
          ],
          color: backgroundColor ?? colorPallete.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: iconColor ?? colorPallete.black,
          size: sizes.width(context) / 8,
        ),
      ),
    );
  }
}
