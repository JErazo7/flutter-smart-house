import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void showModal({
  required BuildContext context,
  required Widget child,
  bool enableDrag = true,
  Clip? clipBehavior,
}) {
  final responsive = ResponsiveWrapper.of(context);

  if (responsive.isDesktop) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          title: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: SizedBox(
            width: 600,
            child: child,
          ),
        );
      },
    );
  } else {
    final maxHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    showModalBottomSheet(
      context: context,
      clipBehavior: clipBehavior,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: responsive.isDesktop
            ? MediaQuery.of(context).size.width / 2
            : double.infinity,
      ),
      enableDrag: enableDrag,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class SmartHouseAlerts {
  const SmartHouseAlerts._();

  static void showSnackBarError(
    BuildContext context,
    String message, {
    Duration duration = const Duration(milliseconds: 4000),
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);
    final snackBar = SnackBar(
      key: const Key('snack_bar_error'),
      backgroundColor: theme.errorColor,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: TextStyle(
          color: theme.colorScheme.onError,
        ),
      ),
    );
    scaffoldMessenger.clearSnackBars();
    scaffoldMessenger.showSnackBar(snackBar);
  }

  static void showSnackBarSuccess(BuildContext context, String message) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);
    final snackBar = SnackBar(
      key: const Key('snack_bar_success'),
      backgroundColor: theme.primaryColor,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: TextStyle(
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
    scaffoldMessenger.clearSnackBars();
    scaffoldMessenger.showSnackBar(snackBar);
  }
}

IconData getIconDataFromId(int id) {
  return IconData(id, fontFamily: 'MaterialIcons');
}

String getFormattedTime(BuildContext context, DateTime date) {
  final languageCode = Localizations.localeOf(context).languageCode;
  return DateFormat.jm(languageCode).format(date);
}
