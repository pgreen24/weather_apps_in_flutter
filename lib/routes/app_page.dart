import 'package:get/get.dart';
import 'package:weather_apps_in_flutter/module/home/home_binding.dart';

import 'package:weather_apps_in_flutter/module/home/home_view.dart';
import 'package:weather_apps_in_flutter/module/splash/splash_binding.dart';
import 'package:weather_apps_in_flutter/module/splash/splash_view.dart';
import 'package:weather_apps_in_flutter/routes/app_routes.dart';

import '../module/shimmer/shimmer_binding.dart';
import '../module/shimmer/shimmer_view.dart';

class AppPage {
  static final initial = AppRoutes.splash;
  static  final routes =[
    GetPage(name: AppRoutes.splash, page: () => SplashPage(),bindings:[SplashBinding()]),
    GetPage(name: AppRoutes.shimmer, page: () => ShimmerPage(),bindings:[ShimmerBinding()]),
    GetPage(name: AppRoutes.home, page: () => HomePage(),bindings:[HomeBinding()]),
  ];
}