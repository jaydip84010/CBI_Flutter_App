import 'package:cbi/presentation/controllers/home_controller.dart';
import 'package:cbi/presentation/modules/dashboard_modules/screens/dashboard_screen.dart';
import 'package:cbi/presentation/modules/home_modules/screens/bcc.screen.dart';
import 'package:cbi/presentation/modules/home_modules/screens/brp_screen.dart';
import 'package:cbi/presentation/modules/home_modules/screens/tcc_screen.dart';
import 'package:cbi/presentation/utils/app_colors.dart';
import 'package:cbi/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          drawerEnableOpenDragGesture: false,
          key: homeController.key,
          drawer: const DashBoardScreen(),
          appBar: AppBar(
            backgroundColor: AppColors.white,
             elevation: 0,
             leading:    Padding(
               padding: const EdgeInsets.all(14.0),
               child: GestureDetector(
                 onTap: () {
                   homeController.key.currentState!.openDrawer();
                 },
                 behavior: HitTestBehavior.translucent,
                 child: Image(
                   image: const AssetImage(AppImages.menu),
                   height: Get.size.width * 0.04,
                   width: Get.size.width * 0.04,
                 ),
               ),
             ) ,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image(
                  image: const AssetImage(AppImages.logo),
                  height: Get.size.width * 0.073,
                  width: Get.size.width * 0.43,
                ),
              ),
            ],
          ),
          body: Obx(
            () => homeController.tab.value == 0
                ? TccScreen()
                : homeController.tab.value == 1
                    ? const BccScreen()
                    : const BrpScreen(),
          ),
          // bottomSheet: Container(
          //   decoration: const BoxDecoration(
          //       color: AppColors.white,
          //       border: Border(
          //         top: BorderSide(color: AppColors.primaryColor, width: 0.6),
          //       )),
          //   height: Get.size.width * 0.18,
          //   width: double.infinity,
          //   child: Obx(
          //     () => Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         CustomBtn(
          //           onTap: () {
          //             homeController.tab.value = 0;
          //           },
          //           height: Get.size.width * 0.1,
          //           width: Get.size.width * 0.24,
          //           btnName: AppText.tcc,
          //           hideGradient: homeController.tab.value == 0 ? true : false,
          //           textColor: homeController.tab.value == 0
          //               ? AppColors.white
          //               : AppColors.black,
          //         ),
          //         CustomBtn(
          //           onTap: () {
          //             homeController.tab.value = 1;
          //           },
          //           height: Get.size.width * 0.1,
          //           width: Get.size.width * 0.24,
          //           btnName: AppText.bcc,
          //           hideGradient: homeController.tab.value == 1 ? true : false,
          //           textColor: homeController.tab.value == 1
          //               ? AppColors.white
          //               : AppColors.black,
          //         ),
          //         CustomBtn(
          //           onTap: () {
          //             homeController.tab.value = 2;
          //           },
          //           height: Get.size.width * 0.1,
          //           width: Get.size.width * 0.24,
          //           btnName: AppText.brp,
          //           hideGradient: homeController.tab.value == 2 ? true : false,
          //           textColor: homeController.tab.value == 2
          //               ? AppColors.white
          //               : AppColors.black,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
