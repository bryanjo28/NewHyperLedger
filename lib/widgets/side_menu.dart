import 'package:flutter/material.dart';
import 'package:flutter_apps1/constants/controllers.dart';
import 'package:flutter_apps1/constants/style.dart';
import 'package:flutter_apps1/helpers/responsiveness.dart';
import 'package:flutter_apps1/pages/authentication/authentication.dart';
import 'package:flutter_apps1/routing/routes.dart';
import 'package:flutter_apps1/widgets/custom_text.dart';
import 'package:flutter_apps1/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Hyper Dash",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(
                      width: _width / 48,
                    )
                  ],
                ),
              ],
            ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map(
                  (item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      if (item.route == AuthenticationPageRoute) {
                        Get.offAllNamed(AuthenticationPageRoute);
                        menuController
                            .changeActiveItemTo(overviewPageDisplayName);
                      }
                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(item.route);
                      }
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
