import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(message: message),
    );
  }

  void showInfo(String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(message: message),
    );
  }

  void showSuccess(String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(message: message),
    );
  }
}
