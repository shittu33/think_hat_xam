import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:think_hat_test/core/navigator_manager.dart';
import 'package:think_hat_test/core/session_manager.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants.dart';
import 'dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logger = Logger();

  SessionManager.instance.sharedPreferences =
      await SharedPreferences.getInstance();

  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: appTheme.light,
      debugShowCheckedModeBanner: false,
      routes: NavigatorManager.routes,
    );
  }
}
