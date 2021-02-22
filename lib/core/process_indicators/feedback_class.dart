import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

enum InfoType {
  error,
  message,
}

class ProcessIndicator {
  static Flushbar showSnackBar(BuildContext context) {
    return Flushbar(
      messageText: const Text('Error'),
    )..show(context);
  }
}
