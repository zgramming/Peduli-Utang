import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../widgets/home_screen/header_home_screen.dart';
import '../widgets/home_screen/button_menu.dart';
import '../widgets/home_screen/due_date.dart';
import '../widgets/home_screen/modalbottomsheet_add_utang.dart';
import '../widgets/home_screen/modalbottomsheet_notification.dart';

import '../screen/statistic_screen.dart';

import '../../providers/global_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      (ctx, read) {
        final utang = read(showUtangUser);
        return utang.when(
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('${error.toString()} || ${stackTrace.toString()}'),
                RaisedButton(
                  onPressed: () => context.refresh(showUtangUser),
                  child: Text('Refresh'),
                )
              ],
            )),
          ),
          data: (_) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  HeaderHomeScreen(),
                  const SizedBox(height: 20),
                  Container(
                    width: sizes.width(context),
                    padding: EdgeInsets.symmetric(horizontal: sizes.width(context) / 15),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: LiveClock(
                          textStyle:
                              appTheme.subtitle2(context).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizes.width(context) / 15),
                    child: Text('Jatuh Tempo', style: appTheme.subtitle2(context)),
                  ),
                  const SizedBox(height: 20),
                  DueDate(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizes.width(context) / 15),
                    child: Text('Menu ', style: appTheme.subtitle2(context)),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15,
                    children: <Widget>[
                      ButtonMenu(
                        icon: Icons.add,
                        backgroundColor: colorPallete.ob3Color,
                        iconColor: colorPallete.white,
                        onTap: () => showModalBottomSheet(
                          context: context,
                          elevation: 5,
                          builder: (ctxMDSUtang) => ModalBottomSheetAddUtang(),
                        ),
                      ),
                      ButtonMenu(
                        icon: Icons.notifications,
                        backgroundColor: colorPallete.ob2Color,
                        iconColor: colorPallete.white,
                        onTap: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          elevation: 5,
                          builder: (ctxMDSNotification) => ModalBottomSheetNotification(),
                        ),
                      ),
                      ButtonMenu(
                        backgroundColor: colorPallete.ob1Color,
                        iconColor: colorPallete.white,
                        icon: Icons.show_chart,
                        onTap: () => Navigator.of(context).pushNamed(StatisticScreen.routeNamed),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: sizes.statusBarHeight(context) * 4),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
