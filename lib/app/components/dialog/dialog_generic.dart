import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/load/load_elements.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class DialogGeneric {
  static Future<void> showGenericDialog({
    required BuildContext context,
    required String title,
    required String description,
    String? negativeText,
    String? positiveText,
    VoidCallback? negativeCallback,
    VoidCallback? positiveCallback,
  }) {
    return showDialog(
      context: context,
      builder: (context) => _DialogGeneric(
        title: title,
        description: description,
        negativeText: negativeText,
        positiveText: positiveText,
        negativeCallback: negativeCallback,
        positiveCallback: positiveCallback,
      ),
    );
  }
}

class _DialogGeneric extends StatelessWidget {
  final String title;
  final String description;
  final String? negativeText;
  final String? positiveText;
  final VoidCallback? negativeCallback;
  final VoidCallback? positiveCallback;

  const _DialogGeneric({
    required this.title,
    required this.description,
    this.negativeText,
    this.positiveText,
    this.negativeCallback,
    this.positiveCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppThemeUtils.titleSize(),
            ),
            SizedBox(height: 20),
            AutoSizeText(
              description,
              style: AppThemeUtils.normalSize(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (negativeText != null)
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (negativeCallback != null) {
                        negativeCallback!();
                      }
                    },
                    child: Text(
                      negativeText!,
                      style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.colorPrimary,
                      ),
                    ),
                  ),
                if (negativeText != null && positiveText != null)
                  SizedBox(width: 20),
                if (positiveText != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppThemeUtils.colorPrimary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if (positiveCallback != null) {
                        positiveCallback!();
                      }
                    },
                    child: Text(
                      positiveText!,
                      style: AppThemeUtils.normalBoldSize(
                        color: AppThemeUtils.whiteColor,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetDialogGeneric extends StatelessWidget {
  final String title;
  final String description;
  final String? negativeText;
  final String? positiveText;
  final VoidCallback? negativeCallback;
  final VoidCallback? positiveCallback;

  const WidgetDialogGeneric({
    required this.title,
    required this.description,
    this.negativeText,
    this.positiveText,
    this.negativeCallback,
    this.positiveCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppThemeUtils.titleSize(),
            ),
            SizedBox(height: 20),
            AutoSizeText(
              description,
              style: AppThemeUtils.normalSize(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (negativeText != null)
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (negativeCallback != null) {
                        negativeCallback!();
                      }
                    },
                    child: Text(
                      negativeText!,
                      style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.colorPrimary,
                      ),
                    ),
                  ),
                if (negativeText != null && positiveText != null)
                  SizedBox(width: 20),
                if (positiveText != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppThemeUtils.colorPrimary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if (positiveCallback != null) {
                        positiveCallback!();
                      }
                    },
                    child: Text(
                      positiveText!,
                      style: AppThemeUtils.normalBoldSize(
                        color: AppThemeUtils.whiteColor,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
