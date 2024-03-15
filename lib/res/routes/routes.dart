import 'package:get/get.dart';
import 'package:noviindus_machine_test/res/routes/routes_name.dart';
import 'package:noviindus_machine_test/view/login_view.dart';
import 'package:noviindus_machine_test/view/splash_view.dart';

class AppRoute {
  static appRoute() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(microseconds: 250)),
        GetPage(
            name: RouteName.splashScreen,
            page: () => LoginScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(microseconds: 250))
      ];
}
