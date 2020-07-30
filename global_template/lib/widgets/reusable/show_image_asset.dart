import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class ShowImageAsset extends StatelessWidget {
  const ShowImageAsset({
    @required this.imageUrl,
    this.imageCircleRadius = 35,
    this.imageWidth = 1,
    this.imageHeight = 1,
    this.isCircle = false,
    this.circleBacgroundColor,
    this.circleBorderColor,
    this.circleBorderThick = 1.0,
    this.color,
    this.padding = const EdgeInsets.all(0),
    this.alignment = Alignment.center,
    this.fit,
  });

  final String imageUrl;

  ///! Setting Tinggi Image berkisar 0-1
  final double imageHeight;

  ///! Setting Width Image Berkisar 0-1
  final double imageWidth;

  ///! Setting Jika Ingin Image Lingkaran
  final bool isCircle;

  ///! Setting Image Circle Radius
  final double imageCircleRadius;

  ///! Setting Padding Image
  final EdgeInsetsGeometry padding;

  ///! Setting Align Image
  final AlignmentGeometry alignment;

  ///! Settings fit Image
  final BoxFit fit;

  ///! Setting Color Image
  final Color color;

  ///! Setting Circle Color Image
  final Color circleBacgroundColor;

  ///! Setting Border Color Image
  final Color circleBorderColor;

  ///! Setting thick circle border image
  final double circleBorderThick;

  @override
  Widget build(BuildContext context) {
    final image = Padding(
      padding: padding,
      child: Image.asset(
        imageUrl,
        color: color,
        height: sizes.height(context) / imageHeight,
        width: sizes.width(context) / imageWidth,
        fit: fit,
        alignment: alignment,
        errorBuilder: (context, error, stackTrace) {
          print('Error $error || stackTrace $stackTrace');
          return Center(
            child: IconButton(
              icon: const Icon(
                Icons.error,
              ),
              // TODO(ErrorImageAsset): Kalau PopUp sudah jadi , implementasikan disini
              onPressed: () => '',
            ),
          );
        },
      ),
    );
    return isCircle
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: circleBorderColor ?? Colors.transparent,
                width: circleBorderThick,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: circleBacgroundColor ?? Colors.transparent,
              radius: imageCircleRadius,
              child: ClipOval(
                child: image,
              ),
            ),
          )
        : image;
  }
}
