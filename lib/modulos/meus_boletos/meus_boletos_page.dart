import 'package:flutter/material.dart';
import 'package:nlw_application/shared/themes/app_colors.dart';
import 'package:nlw_application/shared/themes/app_text_styles.dart';
import 'package:nlw_application/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            children: [
              Text(
                'Meus Boletos',
                style: TextStyles.titleListTile,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: BoletoListWidget(),
          )
        ],
      ),
    );
  }
}
