import 'package:alertas/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'init': (BuildContext context) => InitPage()});
    appRoutes.addAll({'login': (BuildContext context) => LoginPage()});
    appRoutes.addAll({'home': (BuildContext context) => HomePage()});
    appRoutes.addAll({'map': (BuildContext context) => MapPage()});
    appRoutes.addAll({'news': (BuildContext context) => NewsPage()});
    appRoutes.addAll({'register': (BuildContext context) => RegisterPage()});
    appRoutes.addAll({'formPage': (BuildContext context) => NewsFormPage()});
    return appRoutes;
  }
}
