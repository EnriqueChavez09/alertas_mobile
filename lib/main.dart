import 'package:alertas/router/router.dart';
import 'package:alertas/theme/theme.dart';
import 'package:alertas/utils/sp_global.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefs = SPGlobal();
  await prefs.initSharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: AppRoutes.getAppRoutes(),
      initialRoute:
          SPGlobal().getBool("isLogin") ? "init" : AppRoutes.initialRoute,
    );
  }
}
