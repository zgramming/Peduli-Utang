import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:package_info/package_info.dart';

class CopyRightVersion extends StatefulWidget {
  CopyRightVersion({
    this.copyRight = 'Copyright \u00a9 Zeffry Reynando',
    this.colorText = Colors.white,
    this.backgroundColor,
  });
  final String copyRight;
  final Color colorText;
  final Color backgroundColor;
  @override
  _CopyRightVersionState createState() => _CopyRightVersionState();
}

class _CopyRightVersionState extends State<CopyRightVersion> {
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    buildNumber: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
  );
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () => GlobalFunction().packageInfo().then((value) => setState(() => packageInfo = value)));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: widget.colorText),
      child: Container(
        color: widget.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${packageInfo.appName} | Version ${packageInfo.version}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                widget.copyRight,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
