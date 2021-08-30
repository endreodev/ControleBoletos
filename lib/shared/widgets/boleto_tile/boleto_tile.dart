import 'package:flutter/material.dart';
import 'package:nlw_application/shared/models/boleto_model.dart';
import 'package:nlw_application/shared/themes/app_text_styles.dart';

class BoletoTile_widget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTile_widget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(data.nome!),
      subtitle: Text("Vence em ${data.dueDate}"),
      trailing: Text.rich(
        TextSpan(
          text: "R\$",
          style: TextStyles.trailingRegular,
          children: [
            TextSpan(
              text: "${data.value!.toStringAsFixed(2)}",
              style: TextStyles.trailingBold,
            ),
          ],
        ),
      ),
    );
  }

  toList() {}
}
