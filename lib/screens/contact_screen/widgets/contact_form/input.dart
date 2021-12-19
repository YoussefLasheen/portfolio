import 'package:portfolio/assets/constants.dart';

import 'custom_text_form_field.dart';
import 'package:flutter/material.dart';

enum InputStatus { valid, invalid, none }

class AnimTFF extends StatefulWidget {
  final FormFieldValidator<String> validator;
  final String labelText;
  final bool suffix;
  final Color errorColor;
  final Color backgroundColor;
  final Color labelColor;
  final Icon errorIcon;
  final Icon inputIcon;

  final int maxLines;

  const AnimTFF({
    Key key,
    this.validator,
    this.errorIcon = const Icon(
      Icons.warning,
      color: Colors.grey,
    ),
    @required this.inputIcon,
    this.labelText,
    this.suffix = true,
    this.errorColor = Colors.red,
    this.backgroundColor = Colors.black26,
    this.labelColor = Colors.grey,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  _AnimTFFState createState() => _AnimTFFState();
}

class _AnimTFFState extends State<AnimTFF> {
  InputStatus inputStatus = InputStatus.none;
  String lableText;
  Border border;
  Color labelColor;
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode()
      ..addListener(
        () {
          if (focusNode.hasFocus) {
            setState(() {
              var color = mainColor;
              border = getBorder(color);
            });
          } else {
            setState(() {
              var color = Colors.transparent;
              border = getBorder(color);
            });
          }
        },
      );
    setInputDetails();
  }

  String validator(String text) {
    if (widget.validator == null) return null;
    String error = widget.validator(text);
    InputStatus inst;
    if (error == null)
      inst = InputStatus.valid;
    else
      inst = InputStatus.invalid;

    if (inst != inputStatus) {
      inputStatus = inst;
      setInputDetails(error);
      setState(() {});
    }

    return error;
  }

  Border getBorder(Color color) {
    return Border.all(width: 3, color: color);
  }

  void setInputDetails([String error]) {
    switch (inputStatus) {
      case InputStatus.invalid:
        var color = widget.errorColor;
        lableText = error;
        border = getBorder(color);
        labelColor = color;
        break;
      case InputStatus.valid:
        var color = widget.backgroundColor;
        lableText = widget.labelText;
        border = getBorder(color);
        labelColor = Colors.grey;
        break;
      default:
        labelColor = widget.labelColor;
        lableText = widget.labelText;
        border = getBorder(Colors.transparent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          //borderRadius: BorderRadius.circular(5),
          border: border,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (!widget.suffix) getInputIcon(),
              Expanded(
                child: CTextFormField(
                  maxLines: widget.maxLines,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: lableText,
                      labelStyle: TextStyle(color: labelColor),
                      contentPadding: EdgeInsets.all(10)),
                  validator: validator,
                ),
              ),
              if (widget.suffix) getInputIcon()
            ],
          ),
        ),
      ),
    );
  }

  Widget getInputIcon() {
    return SizedBox(
      width: 50,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildIcon(
            inputStatus == InputStatus.invalid,
            widget.errorColor,
            widget.errorIcon,
          ),
        ],
      ),
    );
  }

  Widget buildIcon(bool shouldAnimate, Color color, Icon icon,
      [Curve curve = Curves.fastOutSlowIn]) {
    final double animVal = shouldAnimate ? 0 : -50;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      right: widget.suffix ? animVal : null,
      top: 0,
      left: widget.suffix ? null : animVal,
      bottom: 0,
      curve: curve,
      child: Container(
          width: 50,
          decoration: BoxDecoration(
            /*
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(5),
            ),
            */
            color: color,
          ),
          child: icon),
    );
  }
}
