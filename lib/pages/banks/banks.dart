import 'package:flutter/material.dart';
import 'package:flutter_apps1/constants/controllers.dart';
import 'package:flutter_apps1/helpers/responsiveness.dart';
import 'package:flutter_apps1/pages/banks/banks_add.dart';
import 'package:flutter_apps1/pages/banks/widget/banks_data.dart';
import 'package:flutter_apps1/widgets/custom_text.dart';
import 'package:get/get.dart';

class BanksPage extends StatelessWidget {
  const BanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.only(top: 15, bottom: 15, right: 15)),
                    onPressed: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return new AddBank();
                            },
                            fullscreenDialog: true),
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add New"),
                  ),
                ],
              ),
            ),
            BanksData(),
          ],
        ))
      ],
    );
  }
}
