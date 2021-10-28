import 'package:flutter_apps1/pages/banks/edit_bank.dart';

const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const OverviewPageRoute = "/overview";

const banksPageDisplayName = "Banks";
const BanksPageRoute = "/banks";

const editBankName = "Bank Edit";
const EditBankPageRoute = '/edit_bank';

const clientsPageDisplayName = "Clients";
const ClientsPageRoute = "/clients";

const authenticationPageDisplayName = "Log out";
const AuthenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, OverviewPageRoute),
  MenuItem(banksPageDisplayName, BanksPageRoute),
  MenuItem(clientsPageDisplayName, ClientsPageRoute),
  MenuItem(authenticationPageDisplayName, AuthenticationPageRoute),
];
