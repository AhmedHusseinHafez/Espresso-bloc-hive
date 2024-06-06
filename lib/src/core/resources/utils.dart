import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Future<String> checkConnectivity() async {
//   final connectivity = Connectivity();
//   final result = await connectivity.checkConnectivity();
//   final type = result.name;
//   return type;
// }

// Future<bool> isConnected() async {
//   return await checkConnectivity() == AppConstants.connectivityWifi ||
//       await checkConnectivity() == AppConstants.connectivitymobile;
// }

showErrorToast(String errorMessage, BuildContext context) {
  Fluttertoast.showToast(
    msg: errorMessage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
  );
}

void showWarningToast(String warringMessage, BuildContext context) {
  Fluttertoast.showToast(
    msg: warringMessage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.pink,
  );
}

void showSuccessToast(String doneMessage, BuildContext context) {
  Fluttertoast.showToast(
    msg: doneMessage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
  );
}
