 import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';

Future<dynamic> customAlertDialog(BuildContext context, String message) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Ok',
                      style: Styles.styleSemiBold20(context)
                          .copyWith(color: kgreenDark),
                    ))
              ],
              content: Text(
                message,
                style: Styles.styleBold20(context),
              ),
            ));
  }