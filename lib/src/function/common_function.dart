import 'dart:io';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CommonFunction {
  Future<String> scanQRKU({
    @required BuildContext context,
  }) async {
    try {
      final result = await BarcodeScanner.scan();
      if (result.type == ResultType.Cancelled) {
        throw 'Cancel by user';
      } else {
        if (result.rawContent.isEmpty) {
          throw 'Result scan empty';
        } else {
          return result.rawContent;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<File> takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 80,
      maxHeight: 300,
      maxWidth: 300,
    );
    if (pickedFile == null) {
      return null;
    }
    print(pickedFile.path);
    return File(pickedFile.path);
  }
}
