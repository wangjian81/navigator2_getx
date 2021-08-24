import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_navigator/module/details/details_bind.dart';
import 'package:flutter_web_navigator/module/details/details_page.dart';
import 'package:flutter_web_navigator/module/home/home_bind.dart';
import 'package:flutter_web_navigator/module/home/home_page.dart';
import 'package:flutter_web_navigator/module/login/login_bind.dart';
import 'package:flutter_web_navigator/module/login/login_page.dart';
import 'package:flutter_web_navigator/module/root/root_page.dart';
import 'package:flutter_web_navigator/module/spalsh/splash_bind.dart';
import 'package:flutter_web_navigator/module/spalsh/splash_page.dart';
import 'package:flutter_web_navigator/module/test/test1_bind.dart';
import 'package:flutter_web_navigator/module/test/test1_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootPage(),
      participatesInRootNavigator: true,
      middlewares: [
        ForceNavigateToRouteMiddleware(from: '/', to: '/splash'),
      ],
      children: [
        GetPage(
          name: '/splash',
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBinding(),
          transition: Transition.zoom,
          children: [
            GetPage(
              name: '/test',
              page: () => Test1Page(),
              binding: Test1Binding(),
              transition: Transition.zoom,
              children: [
                GetPage(
                  name: _Paths.PRODUCT_DETAILS,
                  page: () => DeatilsPage(),
                  binding: DetailsBinding(),
                  transition: Transition.zoom,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GetPage(
        name: '/404',
        page: () => NotFoundView(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 300)),
  ];
}

class ForceNavigateToRouteMiddleware extends GetMiddleware {
  final String from;
  final String to;

  ForceNavigateToRouteMiddleware({
    required this.from,
    required this.to,
  });

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    var pos = route.currentTreeBranch.indexWhere((p) => p.name == route.location);
    if (pos == -1) {
      return GetNavConfig.fromRoute('/404');
    }
    if (route.location == from) {
      return GetNavConfig.fromRoute(to);
    }
    return route;
  }
}

class NotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('404'),
        ],
      ),
    );
  }
}
