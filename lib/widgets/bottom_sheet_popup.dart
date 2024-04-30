import 'dart:ui';

import 'package:flutter/material.dart';

class BottomSheetPopUp {
  static Future<int?> show(BuildContext context, Widget widgetToShow) {
    Future<int?> result = showModalBottomSheet<int>(
      showDragHandle: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      builder: (context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0 * 0.14, sigmaY: 7.0 * 0.14),
            child: widgetToShow);
      },
      context: context,
      isDismissible: true,
      isScrollControlled: false,
    );
    return result.then((int? value) => value);
  }
}
