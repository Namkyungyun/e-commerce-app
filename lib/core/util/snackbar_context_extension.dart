import 'package:flutter/material.dart';

extension SnackbarContextExtension on BuildContext {
  ///Scaffold안에 Snackbar를 보여줍니다.
  void showSnackbar(String message, {Widget? extraButton}) {
    _showSnackBarWithContext(
      this,
      _SnackbarFactory.createSnackBar(this, message, extraButton: extraButton),
    );
  }

  ///Scaffold안에 빨간 Snackbar를 보여줍니다.
  void showErrorSnackbar(
    String message, {
    Color bgColor = Colors.black12,
    double bottomMargin = 0,
  }) {
    _showSnackBarWithContext(
      this,
      _SnackbarFactory.createErrorSnackBar(
        this,
        message,
        bgColor: bgColor,
        bottomMargin: bottomMargin,
      ),
    );
  }
}

void _showSnackBarWithContext(BuildContext context, SnackBar snackbar) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

class _SnackbarFactory {
  static SnackBar createSnackBar(
    BuildContext context,
    String message, {
    Color? bgColor,
    Widget? extraButton,
  }) {
    Color snackbarBgColor = bgColor ?? Colors.blue;

    return SnackBar(
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: snackbarBgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            if (extraButton != null) extraButton,
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
    );
  }

  static SnackBar createErrorSnackBar(
    BuildContext context,
    String? message, {
    Color bgColor = Colors.black12,
    double bottomMargin = 0,
  }) {
    return SnackBar(
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        margin: EdgeInsets.only(bottom: bottomMargin),
        child: Text(
          "$message",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      action: SnackBarAction(
        label: message ?? '',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }
}
