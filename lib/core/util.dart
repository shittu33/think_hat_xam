import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:provider/provider.dart';

get zoomOutNavAnimBuilder => (context, animation, secondaryAnimation, child) {
      final tween = Tween<double>(begin: 0, end: 1);
      final offsetAnimation = animation.drive(tween);
      return ScaleTransition(scale: offsetAnimation, child: child);
    };
const transitionDuration = Duration(milliseconds: 400);

launchNewPageWithAnimation(BuildContext context, Widget page,
    {bool replace = false}) {
  var pageRouteBuilder = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: transitionDuration,
    transitionsBuilder: zoomOutNavAnimBuilder,
  );
  if (replace) {
    Navigator.pushReplacement(
      context,
      pageRouteBuilder,
    );
  } else {
    Navigator.push(
      context,
      pageRouteBuilder,
    );
  }
}

launchDialogWithAnimation(
  BuildContext context,
  Widget page,
) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'cancel',
      pageBuilder: (context, animation, secondaryAnimation) =>
          Dialog(child: page),
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<double>(begin: 0, end: 1);
        final offsetAnimation = animation.drive(tween);
        return ScaleTransition(scale: offsetAnimation, child: child);
      });
}

showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: appColor.primary),
        );
      });
}

stopLoading(BuildContext context) {
  Navigator.pop(context);
}

showError(BuildContext context, String message) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            )
          ],
        );
      });
}

showSuccess(BuildContext context, String message) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            )
          ],
        );
      });
}
