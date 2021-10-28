import 'package:flutter/widgets.dart';
import 'package:flutter_apps1/constants/controllers.dart';
import 'package:flutter_apps1/routing/router.dart';
import 'package:flutter_apps1/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      onGenerateRoute: generateRoute,
      initialRoute: OverviewPageRoute,
    );
