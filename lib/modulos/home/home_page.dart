import 'package:flutter/material.dart';
import 'package:nlw_application/modulos/home/home_controler.dart';
import 'package:nlw_application/shared/models/boleto_model.dart';
import 'package:nlw_application/shared/themes/app_text_styles.dart';
import 'package:nlw_application/shared/themes/appcolors.dart';
import 'package:nlw_application/shared/widgets/boleto_tile/boleto_list_widget.dart';
import 'package:nlw_application/shared/widgets/boleto_tile/boleto_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    Container(child: BoletolistWidget()),
    Container(child: null),
  ];

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
      ),
      body: pages[controller.nCurrentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: AppColors.primary,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/barcode');
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {
                  Navigator.pushNamed(context, '/insertBoleto');
                });
              },
              icon: Icon(
                Icons.description_outlined,
                color: AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
