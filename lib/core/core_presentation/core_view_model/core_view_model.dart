import 'package:flutter/material.dart';
import 'package:github_user/core/error/app_failures.dart';
import 'package:github_user/core/process_indicators/feedback_class.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState appViewState;
  String activityMessage;
  setState({ViewState viewState = ViewState.idle, String message}) {
    this.appViewState = viewState;
    this.activityMessage = message;
    notifyListeners();
  }

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
