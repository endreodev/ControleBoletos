import 'package:flutter/material.dart';
import 'package:nlw_application/shared/themes/app_text_styles.dart';

class LabelBarButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  const LabelBarButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: style ?? TextStyles.buttonBoldHeading,
        ),
      ),
    );
  }
}
