import 'package:flutter/material.dart';
import 'package:nlw_application/shared/themes/app_text_styles.dart';
import 'package:nlw_application/shared/themes/appcolors.dart';
import 'package:nlw_application/shared/widgets/bottonSheetWidget/bottonSheet.dart';
import 'package:nlw_application/shared/widgets/label_button/setlabelButton.dart';

import 'barcode_controller.dart';
import 'barcode_status.dart';

class BarcodeScannerPage extends StatefulWidget {
  BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insertBoleto",
            arguments: controller.status.barcode);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: ValueListenableBuilder<BarcodeScannerStatus>(
                valueListenable: controller.statusNotifier,
                builder: (_, status, __) {
                  if (status.showCamera) {
                    return Expanded(
                      child: Container(
                        child: controller.cameraController!.buildPreview(),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: Text(
                    "Escaneie o código de barras do boleto",
                    style: TextStyles.buttonBackground,
                  ),
                  leading: BackButton(
                    color: AppColors.background,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: setlabelButton(
                  primaryLabel: "Inserir código do boleto",
                  primaryOnPressed: () {
                    controller.status = BarcodeScannerStatus.error("Error");
                  },
                  secundaryLabel: "Adicionar da galeria",
                  secundaryOnPressed: controller.scanWithImagePicker,
                )),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return Align(
                      alignment: Alignment.bottomLeft,
                      child: bottonsheetwidget(
                          primaryLabel: "Escanear novamente",
                          primaryOnPressed: () {
                            controller.scanWithCamera();
                          },
                          secundaryLabel: "Digitar código",
                          secundaryOnPressed: () {
                            Navigator.pushNamed(context, '/insertBoleto');
                          },
                          title:
                              "Não foi possível identificar um código de barras.",
                          subtitle:
                              "Tente escanear novamente ou digite o código do seu boleto."));
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
