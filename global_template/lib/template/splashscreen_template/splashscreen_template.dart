import 'dart:async';
import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class SplashScreenTemplate extends StatefulWidget {
  const SplashScreenTemplate({
    this.duration = 4,
    this.backgroundColor,
    @required this.image,
    @required this.navigateAfterSplashScreen,
    @required this.copyRightVersion,
  });

  final int duration;
  final Widget image;
  final WidgetBuilder navigateAfterSplashScreen;
  final Color backgroundColor;
  final CopyRightVersion copyRightVersion;
  @override
  _SplashScreenTemplateState createState() => _SplashScreenTemplateState();
}

class _SplashScreenTemplateState extends State<SplashScreenTemplate> {
  void navigationPage() => Future.delayed(
        const Duration(milliseconds: 500),
        () {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: widget.navigateAfterSplashScreen),
            );
          }
        },
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final durations = Duration(seconds: widget.duration);
      Timer(
        durations,
        () => navigationPage(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 10,
            child: widget.image,
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: widget.copyRightVersion,
            ),
          ),
        ],
      ),
    );
  }
}
