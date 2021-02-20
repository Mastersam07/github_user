import 'package:flutter/material.dart';
import '../../error/app_failures.dart';
import '../../process_indicators/feedback_class.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState appViewState;
  String activityMessage;
  // ignore: always_declare_return_types
  setState({ViewState viewState = ViewState.idle, String message}) {
    appViewState = viewState;
    activityMessage = message;
    notifyListeners();
  }

  // ignore: always_declare_return_types
  handleFailure(BuildContext context, ActionFailure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        // ServerFailure serverFailure = failure;
        ProcessIndicator.showSnackBar(
          context,
          // message: serverFailure.message,
          // type: IndicatorType.error,
        );
        break;
      case NetworkFailure:
        ProcessIndicator.showSnackBar(
          context,
          // message: "Network Error,Please connect to the internet",
          // type: IndicatorType.error,
        );
        break;
      default:
        ProcessIndicator.showSnackBar(
          context,
          //   message: 'An error occurred',
        );
    }
  }
}

enum ViewState {
  loading,
  idle,
}
