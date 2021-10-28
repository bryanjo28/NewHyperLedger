import 'package:flutter/material.dart';
import 'package:flutter_apps1/helpers/responsiveness.dart';
import 'package:flutter_apps1/widgets/large_screen.dart';
import 'package:flutter_apps1/widgets/side_menu.dart';
import 'package:flutter_apps1/widgets/small_screen.dart';
import 'package:flutter_apps1/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
