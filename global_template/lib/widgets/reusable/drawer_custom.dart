import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class DrawerCustom extends StatelessWidget {
  final Widget imageBuilder;
  final Color drawerHeaderColor;
  final List<Widget> detailUser;
  final List<Widget> drawerMenu;
  final Color defaultTextColor;

  DrawerCustom({
    @required this.imageBuilder,
    @required this.detailUser,
    @required this.drawerMenu,
    this.defaultTextColor = Colors.white,
    this.drawerHeaderColor,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: sizes.screenHeightMinusStatusBar(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    color: drawerHeaderColor ?? Theme.of(context).primaryColor,
                    child: Row(
                      children: <Widget>[
                        Flexible(flex: 4, fit: FlexFit.tight, child: imageBuilder),
                        Flexible(
                          flex: 8,
                          fit: FlexFit.tight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DefaultTextStyle(
                              style: TextStyle(color: defaultTextColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: detailUser,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 10,
                  child: DefaultTextStyle(
                    style: TextStyle(color: Colors.red),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: drawerMenu,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
