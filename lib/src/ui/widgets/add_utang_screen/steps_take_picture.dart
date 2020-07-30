import 'dart:io';

import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../../../function/common_function.dart';

class StepsTakePicture extends StatelessWidget {
  final Function onPickedImage;
  final File pickedImage;
  StepsTakePicture({@required this.onPickedImage, @required this.pickedImage});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Selfie',
          style: appTheme.headline6(context).copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Center(
          child: InkWell(
            onTap: () async {
              final result = await CommonFunction().takePicture();
              onPickedImage(result);
            },
            child: pickedImage == null
                ? Card(
                    child: CircleAvatar(
                      radius: sizes.width(context) / 6,
                      backgroundColor: colorPallete.white,
                      foregroundColor: colorPallete.black,
                      child: Icon(
                        Icons.camera_front,
                        size: sizes.width(context) / 6,
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ShowImageFile(
                      file: pickedImage,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
