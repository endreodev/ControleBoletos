import 'package:flutter/material.dart';
import 'package:nlw_application/shared/themes/app_text_styles.dart';
import 'package:nlw_application/shared/themes/appcolors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: Size.fromHeight(152),
      child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Ola, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                        text: "Endreo",
                        style: TextStyles.titleBoldHeading,
                      ),
                    ]),
              ),
              subtitle: Text(
                "Mantenha suas contas em dia.",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )),
    ));
  }
}
