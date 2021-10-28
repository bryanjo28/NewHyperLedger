import 'package:flutter/material.dart';
import 'package:flutter_apps1/pages/banks/banks.dart';
import 'package:flutter_apps1/pages/banks/edit_bank.dart';
import 'package:flutter_apps1/pages/clients/clients.dart';
import 'package:flutter_apps1/pages/overview/overview.dart';
import 'package:flutter_apps1/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverviewPageRoute:
      return _getPageRoute(OverViewPage());
    case BanksPageRoute:
      return _getPageRoute(BanksPage());
    case ClientsPageRoute:
      return _getPageRoute(ClientsPage());
    case EditBankPageRoute:
      return _getPageRoute(EditBank());
    default:
      return _getPageRoute(OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
