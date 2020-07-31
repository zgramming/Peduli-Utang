import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../providers/global_provider.dart';

import './due_date_action.dart';
import './due_date_profil.dart';
import './due_date_detail.dart';

import '../../screen/detail_utang_screen.dart';

class DueDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes.width(context) / 15),
      child: SizedBox(
        height: sizes.height(context) / 3.25,
        child: Consumer((ctx, read) {
          final utang = read(deadlineUtang);
          if (utang.isEmpty) {
            return Align(alignment: Alignment.center, child: Text('Utang tidak ditemukan'));
          }
          return ListView.builder(
            itemCount: utang.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemExtent: sizes.width(context) / 1.25,
            itemBuilder: (BuildContext context, int index) {
              final result = utang[index];
              return InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(DetailUtangScreen.routeNamed, arguments: result),
                child: Card(
                  margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        DueDateProfil(model: result),
                        SizedBox(height: sizes.height(context) / 30),
                        DueDateDetail(model: result),
                        DueDateAction(model: result),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
