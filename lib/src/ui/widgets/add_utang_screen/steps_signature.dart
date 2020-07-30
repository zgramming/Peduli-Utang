import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_signature_view/flutter_signature_view.dart';
import 'package:global_template/global_template.dart';

class StepsSignature extends StatelessWidget {
  final Function onPickedSignature;
  final Uint8List exportedSignature;
  StepsSignature({@required this.onPickedSignature, @required this.exportedSignature});
  final SignatureView _signatureView = SignatureView(
    backgroundColor: colorPallete.accentColor,
    penStyle: Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0,
  );

  void _exportSignatureToBytes() async {
    if (_signatureView == null) {
      return;
    }
    final signatureToBytes = await _signatureView.exportBytes();
    onPickedSignature(signatureToBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Tanda Tangan',
          style: appTheme.headline6(context).copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: sizes.height(context) / 4,
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(child: _signatureView),
                    Row(
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child: IconButton(
                            onPressed: () => _signatureView.clear(),
                            icon: Icon(Icons.refresh),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: IconButton(
                            onPressed: _exportSignatureToBytes,
                            icon: Icon((Icons.done)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: exportedSignature == null
                    ? SizedBox()
                    : SizedBox(
                        height: double.infinity,
                        child: Image.memory(
                          exportedSignature,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                          color: colorPallete.primaryColor,
                        ),
                      ),
                fit: FlexFit.tight,
              ),
            ],
          ),
        )
      ],
    );
  }
}
