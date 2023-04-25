import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import '../pages/components/loading_overlay.dart';

class Utils {
  static void showLoader(context) {
    showDialog(
      context: context,
      builder: (ctx) => const Loader(),
    );
  }

  static void showTopSnackBar(
    BuildContext context,
    String message,
    Color color,
  ) =>
      showSimpleNotification(
        Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        position: NotificationPosition.top,
        slideDismissDirection: DismissDirection.up,
        background: color,
        duration: const Duration(seconds: 5),
      );
}
