import 'package:get/get.dart';
import 'package:sampark/config/routes/routes_name.dart';
import 'package:sampark/views/auth/register/register_view.dart';
import 'package:sampark/views/chatView/chat_view.dart';
import 'package:sampark/views/home/home_view.dart';

import '../../views/auth/login/login_view.dart';

class Routes {
  static var views = [
    GetPage(
      name: RoutesName.loginView,
      page: () => const LoginView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.registerView,
      page: () => const RegisterView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.homeView,
      page: () => const HomeView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.chatView,
      page: () => const ChatView(),
      transition: Transition.rightToLeft,
    )
  ];
}
