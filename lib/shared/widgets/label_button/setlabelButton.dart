import 'package:flutter/material.dart';
import 'package:nlw_application/shared/themes/app_text_styles.dart';

import 'label_button.dart';

class setlabelButton extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback secundaryOnPressed;
  final bool enablePrimarycolor;

  const setlabelButton({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secundaryLabel,
    required this.secundaryOnPressed,
    this.enablePrimarycolor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: LabelBarButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
              style: enablePrimarycolor ? TextStyles.buttonBoldPrimary : null,
            ),
          ),
          Container(
            height: 55,
            width: 1,
            color: Colors.black,
          ),
          Expanded(
            child: LabelBarButton(
              label: secundaryLabel,
              onPressed: secundaryOnPressed,
            ),
          )
        ],
      ),
    );
  }
}
