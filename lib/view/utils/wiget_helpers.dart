import 'package:flutter/material.dart';
import 'package:tech_task/view/utils/colors.dart';

class WidgetHelpers {
  WidgetHelpers._();

  // show dialog
  static Future<void> showStatusDialog(
      BuildContext context, {
        String title,
        bool error = true,
      }) async {
    showDialog(
      context: context,
      barrierColor: kBlack.withOpacity(.6),
      builder: (_) {
        return Dialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: error ? kRed : kGreen),
                      child: Center(
                        child: Icon(
                          error ? Icons.close : Icons.check,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    title ??= error
                        ? 'Something went wrong. Try again!'
                        : 'Operation successful. Cheers!',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // show loading dialog
  static Future<void> showLoadingDialog(BuildContext context,
      {String title}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: kBlack.withOpacity(0.6),
      builder: (_) {
        return Dialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    child: Text(
                      title ?? 'Please wait...',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
