import 'package:flutter/foundation.dart';
import 'package:nlw_application/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletoNotifaier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletoNotifaier.value;
  set boletos(List<BoletoModel> value) => boletoNotifaier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    final instance = await SharedPreferences.getInstance();

    final response = instance.getStringList('boletos') ?? <String>[];
    boletos = response.map((e) => BoletoModel.fromJson(e)).toList();

    boletos = boletos;
  }
}
