import 'package:favorite_places/main.dart';
import 'package:flutter/material.dart';

class Utils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void showSnackBar(String? message) {
    if (message == null) {
      return;
    }

    final SnackBar snackBar = SnackBar(
      content: Text(message),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Future<void> displayDialog(BuildContext context, Widget child) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: child,
          );
        });
  }

  static Future<void> showBottomSheet(BuildContext context, Widget child) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }
}
