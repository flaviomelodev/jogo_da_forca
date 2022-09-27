import 'package:flutter/material.dart';

class TextButtonWithSnackBarWidget extends StatelessWidget {
  final bool onPressedVisible;
  final String buttonText;
  final String sucessTextToSnackBar;
  final Function onButtonPressed;
  final Function onSnackBarClosed;
  final String failTextSnackBar;

  const TextButtonWithSnackBarWidget(
      {Key? key,
      required this.onPressedVisible,
      required this.buttonText,
      required this.sucessTextToSnackBar,
      required this.onButtonPressed,
      required this.onSnackBarClosed,
      required this.failTextSnackBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:
            onPressedVisible ? () => _onPressedTextButton(context) : null,
        child: Text(buttonText));
  }

  _onPressedTextButton(BuildContext buildContext) async {
    String textToSnackBar = sucessTextToSnackBar;
    bool sucess = true;
    FocusScope.of(buildContext).unfocus();

    try {
      await onButtonPressed();
    } catch (e) {
      textToSnackBar = failTextSnackBar + ': ' + e.toString();
      sucess = false;
    }
    ScaffoldMessenger.of(buildContext)
        .showSnackBar(
          SnackBar(
            backgroundColor: (sucess) ? Colors.indigo : Colors.red,
            content: Text(
              textToSnackBar,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: Duration(seconds: (sucess) ? 3 : 5),
          ),
        )
        .closed
        .then((_) => (sucess) ? onSnackBarClosed() : () {});
  }
}
