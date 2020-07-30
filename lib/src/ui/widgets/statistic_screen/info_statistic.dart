import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

enum Position { LEFT, RIGHT }

class InfoStatistic extends StatelessWidget {
  final String imageAssetUrl;
  final Position position;
  final List<InlineSpan> textChildren;
  final bool isVisible;

  InfoStatistic({
    @required this.imageAssetUrl,
    @required this.textChildren,
    this.isVisible = true,
    this.position = Position.LEFT,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SizedBox(
        height: sizes.height(context) / 7,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (position == Position.LEFT) ...[
              ShowImageAsset(
                imageUrl: imageAssetUrl,
                isCircle: true,
                circleBorderColor: colorPallete.accentColor,
                circleBorderThick: 2,
                padding: const EdgeInsets.all(8.0),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: SizedBox(
                    height: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText.rich(
                          TextSpan(children: textChildren),
                          maxLines: 4,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ] else ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: SizedBox(
                    height: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText.rich(
                          TextSpan(children: textChildren),
                          maxLines: 4,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ShowImageAsset(
                imageUrl: imageAssetUrl,
                isCircle: true,
                circleBorderColor: colorPallete.accentColor,
                circleBorderThick: 2,
                padding: const EdgeInsets.all(8.0),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
