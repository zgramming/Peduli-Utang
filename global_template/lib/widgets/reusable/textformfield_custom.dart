import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatefulWidget {
  const TextFormFieldCustom({
    this.controller,
    this.prefixIcon = const Icon(Icons.supervised_user_circle),
    this.suffixIcon,
    this.initialValue,
    this.minLines,
    this.maxLines,
    this.focusNode,
    this.borderColor,
    this.borderFocusColor,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.onChanged,
    this.radius = 8,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.autoFocus = false,
    this.centerText = false,
    this.isDone = false,
    this.isPassword = false,
    this.disableOutlineBorder = true,
    this.isEnabled = true,
    this.isValidatorEnable = true,
    this.backgroundColor = Colors.white,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    @required this.onSaved,
  });
  final Widget prefixIcon;
  final Widget suffixIcon;

  final String hintText;
  final String labelText;
  final String initialValue;

  final bool isPassword;
  final bool isEnabled;
  final bool isDone;
  final bool centerText;
  final bool isValidatorEnable;
  final bool disableOutlineBorder;
  final bool autoFocus;

  final int minLines;
  final int maxLines;

  final double radius;

  final Color backgroundColor;
  final Color borderColor;
  final Color borderFocusColor;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final FocusNode focusNode;

  final List<TextInputFormatter> inputFormatter;

  final TextEditingController controller;

  final TextStyle hintStyle;

  final Function(String) onFieldSubmitted;
  final Function(String) onChanged;
  final Function(String) onSaved;

  @override
  _TextFormFieldCustomState createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool _obsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          autofocus: widget.autoFocus,
          controller: widget.controller,
          textAlign: widget.centerText ? TextAlign.center : TextAlign.left,
          obscureText: (widget.isPassword && _obsecurePassword) ? true : false,
          enabled: widget.isEnabled,
          initialValue: widget.initialValue,
          minLines: widget.minLines,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          decoration: InputDecoration(
            fillColor: widget.disableOutlineBorder ? Colors.transparent : widget.backgroundColor,
            filled: true,
            hintStyle: widget.hintStyle,
            prefixIcon: widget.isPassword ? const Icon(Icons.lock) : widget.prefixIcon,
            hintText: widget.hintText,
            labelText: widget.labelText,
            border: widget.disableOutlineBorder
                ? null
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
            enabledBorder: widget.disableOutlineBorder
                ? null
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(
                      color: widget.borderColor ?? Colors.grey[400],
                    ),
                  ),
            focusedBorder: widget.disableOutlineBorder
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderFocusColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
            contentPadding: const EdgeInsets.all(8.0),
          ),
          textInputAction: widget.isDone ? TextInputAction.done : widget.textInputAction,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatter,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          validator: widget.isValidatorEnable
              ? (value) {
                  if (value.isEmpty || value == null) {
                    return '${widget.labelText} tidak boleh kosong ';
                  }
                  return null;
                }
              : null,
          onSaved: widget.onSaved,
        ),
        if (widget.isPassword) ...[
          IconButton(
            icon: Icon(
              _obsecurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
            ),
            onPressed: () => setState(() => _obsecurePassword = !_obsecurePassword),
          )
        ] else ...[
          widget.suffixIcon ?? const SizedBox()
        ]
      ],
    );
  }
}
