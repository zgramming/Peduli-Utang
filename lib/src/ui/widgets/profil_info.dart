import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class ProfilInfo extends StatelessWidget {
  final String username;
  final String email;
  final String photo;
  const ProfilInfo({
    @required this.email,
    @required this.username,
    this.photo,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ShowImageNetwork(
              imageUrl: photo ?? AppConfig.defaultImageNetwork,
              fit: BoxFit.cover,
              isCircle: true,
              imageCircleRadius: sizes.width(context) / 9,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    username ?? 'nulled',
                    style: appTheme.headline6(context).copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    child: Text(
                      email ?? 'nulled',
                      style: appTheme.subtitle2(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
