import 'package:flutter/cupertino.dart';
import 'package:nlw_application/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não poder ser vazio" : null;

  String? validateVencimento(String? value) => value?.isEmpty ?? true
      ? "A data do vencimento não poder ser vazio"
      : null;
  String? validateValor(double value) =>
      value == 0 ? "O Valor não poder ser vazio" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O codigo não poder ser vazio" : null;

  void onChange({
    String? nome,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      nome: nome,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());

    await instance.setStringList("boletos", boletos);

    return;
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      print(model);
      return saveBoleto();
    }
  }
}
