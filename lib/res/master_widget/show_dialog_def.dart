import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showDialogDef({
  required Function() ok,
  required String okText,
  Function()? close,
  String? closText,
  required String title,
  required String masseg,
}) {
  return Get.dialog(
    AlertDialog(
      actions: [
        ElevatedButton(onPressed: ok, child: Text(okText)),
        if (close != null && closText != null)
          ElevatedButton(onPressed: close, child: Text(closText)),
      ],
      title: Text(title),
      content: Text(masseg),
    ),
  );
}
