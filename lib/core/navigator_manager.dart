import 'package:flutter/cupertino.dart';
import 'package:think_hat_test/dependency_injection.dart';
import 'package:think_hat_test/features/auth/presentation/screen/login_screen.dart';
import 'package:think_hat_test/features/home/presentation/vm/home_vm.dart';
import 'package:think_hat_test/features/home/presentation/screen/home_screen.dart';
import 'package:think_hat_test/features/orders/presentation/screen/order_details.dart';
import 'package:think_hat_test/features/orders/presentation/screen/order_page.dart';
import 'package:provider/provider.dart';

class NavigatorManager {
  static const String initial = "/";
  static const String home = "home";
  static const String order = "order";
  static const String orderDetails = "orderDetailsPage";
  static const String shipment = "shipment";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const LoginScreen(),
    home: (context) => ChangeNotifierProvider(
        create: (BuildContext context) => getIt<HomePageViewModel>(),
        child: const HomeScreen()),
    order: (context) => const OrderPage(),
    orderDetails: (context) => const OrderDetailsPage(),
  };

  static Future navigateTo(
    BuildContext context,
    name, {
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.of(context).popAndPushNamed(name);
    } else {
      return Navigator.of(context).pushNamed(name);
    }
  }
}
