import 'package:get/get.dart';
import 'Pages/homedrawer_pages.dart';
import 'Pages/login_pages.dart';
import 'Pages/transaction_page.dart';
import 'models/food_model.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String transaction = '/transaction';

  static final List<GetPage<dynamic>> mypages = [
    GetPage<dynamic>(name: login, page: () => const LoginPage()),
    GetPage<dynamic>(name: home, page: () => MainMenuDrawer()),
    GetPage<dynamic>(name: transaction, page: () => TransactionPage(item: Get.arguments as FoodItem),
    ),
  ];
}
