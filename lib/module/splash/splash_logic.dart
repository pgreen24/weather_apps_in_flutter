import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashLogic extends GetxController {


  @override
  Future<void> onInit() async {
    super.onInit();

    await Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home);
    });

  }

}
