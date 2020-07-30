import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class DrawerMenu extends StatelessWidget {
  final Function onTap;
  final Color color;
  final String menuName;
  final IconData icon;
  DrawerMenu({
    this.onTap,
    this.icon = Icons.subscriptions,
    this.color = Colors.black,
    this.menuName = 'Beranda',
  });
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: sizes.width(context),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Icon(
                  icon,
                  size: sizes.width(context) / 14,
                  color: color,
                ),
              ),
              Flexible(
                flex: 10,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    menuName,
                    style: TextStyle(fontSize: 14, color: color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
