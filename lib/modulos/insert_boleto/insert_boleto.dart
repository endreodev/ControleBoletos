import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nlw_application/shared/themes/app_text_styles.dart';
import 'package:nlw_application/shared/themes/appcolors.dart';
import 'package:nlw_application/shared/widgets/input_text_widget.dart';
import 'package:nlw_application/shared/widgets/label_button/setlabelButton.dart';

import 'insert_boleto_controller.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;

  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();
  final moneyInpuTextController = MoneyMaskedTextController(leftSymbol: 'R\$ ');
  final dataInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.grey,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
            child: Text(
              'Preencher os dados do boleto',
              style: TextStyles.titleBoldHeadingBlack,
              textAlign: TextAlign.center,
            ),
          ),
          Form(
              key: controller.formKey,
              child: Column(
                children: [
                  InputTextWidget(
                    label: "Nome do Boleto",
                    icon: Icons.description_outlined,
                    onChanged: (value) {
                      controller.onChange(nome: value);
                    },
                    validator: controller.validateName,
                  ),
                  InputTextWidget(
                      label: "Vencimento",
                      icon: Icons.timer_off_outlined,
                      onChanged: (value) {
                        controller.onChange(dueDate: value);
                      },
                      controller: dataInputTextController,
                      validator: controller.validateVencimento),
                  InputTextWidget(
                    label: "Valor",
                    icon: Icons.wallet_travel,
                    onChanged: (value) {
                      controller.onChange(
                          value: moneyInpuTextController.numberValue);
                    },
                    controller: moneyInpuTextController,
                    validator: (_) => controller
                        .validateValor(moneyInpuTextController.numberValue),
                  ),
                  InputTextWidget(
                    label: "Codigo Barras",
                    icon: Icons.bar_chart_sharp,
                    onChanged: (value) {
                      controller.onChange(barcode: value);
                    },
                    controller: barcodeInputTextController,
                    validator: controller.validateCodigo,
                  ),
                ],
              ))
        ],
      ),
      bottomNavigationBar: setlabelButton(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        secundaryLabel: 'Cadastrar',
        secundaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pushNamed(context, '/home');
        },
        enableSecundarycolor: true,
      ),
    );
  }
}
