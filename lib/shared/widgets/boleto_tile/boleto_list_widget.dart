import 'package:flutter/material.dart';
import 'package:nlw_application/modulos/insert_boleto/boleto_list_controler.dart';
import 'package:nlw_application/shared/models/boleto_model.dart';
import 'boleto_tile.dart';

class BoletolistWidget extends StatefulWidget {
  const BoletolistWidget({Key? key}) : super(key: key);

  @override
  _BoletolistWidgetState createState() => _BoletolistWidgetState();
}

class _BoletolistWidgetState extends State<BoletolistWidget> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: controller.boletoNotifaier,
      builder: (_, boleto, __) => Column(
        children: boleto.map((e) => BoletoTile_widget(data: e)).toList(),
      ),
    );
  }
}
