import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

enum InfoType {
  error,
  message,
}

class ProcessIndicator {
  static showSnackBar(BuildContext context) {
    Flushbar(
      messageText: Text("Error"),
    )..show(context);
  }
}
