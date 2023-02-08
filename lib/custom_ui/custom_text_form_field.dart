
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final Widget? labelWidget;
  final Color? color;
  final Color borderColor;
  final Color fillColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FocusNode? focusTo;
  final Function? validator;
  final Function? onSaved;
  final TextInputType? inputType;
  final int? maxLine;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final bool isPasswordField;
  final bool readOnly;
  final Icon? suffixIcon;
  final String? suffixText;
  final Icon? prefixIcon;
  final String? prefixText;
  final String? hint;
  bool _showPassword = false;
  bool isEnabled;
  String? initialText;
  bool showBorder;
  final List<TextInputFormatter>? textinputFormatters;
  final Function? onTextChanged;
  final double? borderRadius;
  final TextAlign textAlign;
  final Color textInputColor;

 CustomTextFormField(
      {this.label,
      this.labelWidget,
      this.color,
      this.textInputColor = Colors.purple,
      this.borderColor = Colors.purple,
      this.fillColor = const Color(0xFFFAFAFA),
      this.fontSize,
      this.textEditingController,
      this.fontWeight,
      this.focusTo,
      this.validator,
      this.onSaved,
      this.inputType = TextInputType.text,
      this.maxLine = 1,
      this.textInputAction = TextInputAction.next,
      this.focusNode,
      this.isPasswordField = false,
      this.readOnly = false,
      this.suffixIcon,
      this.suffixText = "",
      this.prefixIcon,
      this.prefixText,
      this.textinputFormatters,
      this.isEnabled = true,
      this.initialText,
      this.hint,
      this.onTextChanged,
      this.borderRadius = 5,
      this.textAlign = TextAlign.start,
      this.showBorder = true});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: widget.textInputColor),
      initialValue: widget.initialText,
      textAlign: widget.textAlign,
      onChanged: (text) {
        if (widget.onTextChanged != null) widget.onTextChanged!(text);
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.hint,
          label: widget.labelWidget,
          labelText: widget.label,
          prefixIcon: widget.prefixIcon,
          prefixText: widget.prefixText,
          labelStyle: TextStyle(
              color: widget.color,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight),
          focusedBorder: widget.showBorder
              ? OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.borderRadius!)),
                  borderSide: BorderSide(
                      width: 1, color: Theme.of(context).primaryColor),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Theme.of(context).primaryColor),
                ),
          disabledBorder: widget.showBorder
              ? OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.borderRadius!)),
                  borderSide: BorderSide(width: 1, color: Colors.blueGrey),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.blueGrey),
                ),
          enabledBorder: widget.showBorder
              ? OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.borderRadius!)),
                  borderSide: BorderSide(width: 1, color: widget.borderColor),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: widget.borderColor),
                ),
          border: widget.showBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius!),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                  ))
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                  width: 1,
                )),
          errorMaxLines: 2,
          errorBorder: widget.showBorder
              ? OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.borderRadius!)),
                  borderSide: BorderSide(width: 1, color: Colors.red))
              : UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black)),
          contentPadding: widget.showBorder
              ? EdgeInsets.only(left: 10, right: 10, top: 10)
              : EdgeInsets.only(left: 4, right: 10, top: 3),
          isDense: true,
          enabled: widget.isEnabled,
          suffix: Text(
            widget.suffixText!,
            style: TextStyle(color: Colors.black87),
          ),
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 16.0,
                    color: widget._showPassword
                        ? Colors.red
                        : Colors.black54,
                  ),
                  onPressed: () {
                    setState(
                        () => widget._showPassword = !widget._showPassword);
                  },
                )
              : (widget.suffixIcon != null ? widget.suffixIcon : SizedBox())),
      keyboardType: widget.inputType,
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLine,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(widget.focusTo),
      onSaved: (value) {
        if (widget.onSaved != null) widget.onSaved!(value);
      },
      validator: (value) {
        if (widget.validator != null) return widget.validator!(value);
      },
      focusNode: widget.focusNode,
      controller: widget.textEditingController,
      obscureText: widget.isPasswordField ? !widget._showPassword : false,
      inputFormatters: widget.textinputFormatters,
      readOnly: widget.readOnly,
    );
  }
}
