import 'package:flutter/material.dart';
import 'package:flutter_apps1/constants/controllers.dart';
import 'package:flutter_apps1/helpers/responsiveness.dart';
import 'package:flutter_apps1/pages/overview/widgets/bank_list.dart';
import 'package:flutter_apps1/pages/overview/widgets/overview_cards_large.dart';
import 'package:flutter_apps1/pages/overview/widgets/overview_cards_medium.dart';
import 'package:flutter_apps1/pages/overview/widgets/overview_cards_small.dart';
import 'package:flutter_apps1/widgets/custom_text.dart';
import 'package:get/get.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({Key? key}) : super(key: key);

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
          child: ListView(children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                OverviewCardsMediumScreen()
              else
                OverviewCardsLargeScreen()
            else
              OverviewCardsSmallScreen(),
            BankList()
          ]),
        )
      ],
    );
  }
}
