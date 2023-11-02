// ignore_for_file: use_build_context_synchronously

import 'package:cbi/presentation/controllers/dashboard_controller.dart';
import 'package:cbi/presentation/controllers/home_controller.dart';
import 'package:cbi/presentation/modules/dashboard_modules/screens/contact_screen.dart';
import 'package:cbi/presentation/modules/dashboard_modules/widgets/dashboard_menu_widget.dart';
import 'package:cbi/presentation/modules/home_modules/screens/bcc.screen.dart';
import 'package:cbi/presentation/modules/home_modules/screens/brp_screen.dart';
import 'package:cbi/presentation/modules/home_modules/screens/tcc_screen.dart';
import 'package:cbi/presentation/utils/app_colors.dart';
import 'package:cbi/presentation/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widget/labels.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    final HomeController homeController = Get.find();

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      child: SizedBox(
        width: Get.size.width * 0.7,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.size.width * 0.1),
                // DashBoardMenuWidget(
                //   titleName: AppText.home,
                //   onTap: () async {
                //     final Uri url = Uri.parse('https://cbilaw.co.za/',);
                //     if (!await launchUrl(url)) {
                //       print("ajaya  ajajajajajajajajjajajaja");
                //       // throw Exception('Could not launch $url');
                //     }else{
                //       Center(child: CircularProgressIndicator());
                //       print("fsfsfsfsfsfsfsfsf ---------------");
                //     }
                //     Scaffold.of(context).closeDrawer();
                //
                //   },
                // ),
                // DashBoardMenuWidget(
                //   titleName: AppText.aboutUs,
                //   onTap: () async {
                //     final Uri url =
                //         Uri.parse('https://cbilaw.co.za/who-we-are/');
                //     if (!await launchUrl(url)) {
                //       throw Exception('Could not launch $url');
                //     }
                //     Scaffold.of(context).closeDrawer();
                //   },
                // ),
                ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  shape: Border.all(color: Colors.transparent),
                  tilePadding:
                      EdgeInsets.symmetric(horizontal: Get.size.width * 0.1),
                  onExpansionChanged: (expanded) {
                    if (expanded) {
                      dashboardController.titleTextColor.value = true;
                    } else {
                      dashboardController.titleTextColor.value = false;
                    }
                  },
                  title: Obx(
                    () => Labels(
                      text: AppText.transfer,
                      fontWeight: FontWeight.w600,
                      fontSize: Get.size.width * 0.036,
                      color: dashboardController.titleTextColor.value == true
                          ? AppColors.primaryColor
                          : AppColors.black,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.size.width * 0.1),
                      child: Container(
                        height: Get.size.width * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.black,
                              blurRadius: 1.0,
                            )
                          ],
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryColor,
                              AppColors.droverPopUp.withOpacity(0.9),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Obx(
                                  () => GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () async {
                                      dashboardController.transferOnTap.value =
                                          AppText.transferCostCalculator;
                                      homeController.tab.value = 0;
                                      Get.back();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: Get.size.width * 0.1,
                                      decoration: dashboardController
                                                  .transferOnTap.value ==
                                              AppText.transferCostCalculator
                                          ? BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            )
                                          : null,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Labels(
                                            text:
                                                AppText.transferCostCalculator,
                                            color: dashboardController
                                                        .transferOnTap.value ==
                                                    AppText
                                                        .transferCostCalculator
                                                ? AppColors.primaryColor
                                                : AppColors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: Get.size.width * 0.03,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Obx(
                                  () => GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () async {
                                      dashboardController.transferOnTap.value =
                                          AppText.bondCostCalculator;
                                      homeController.tab.value = 1;
                                      Get.back();

                                      // final Uri url = Uri.parse(
                                      //     'https://cbilaw.co.za/fields-of-expertise/property-law-conveyancing/document-checklist/');
                                      // if (!await launchUrl(url)) {
                                      //   throw Exception(
                                      //       'Could not launch $url');
                                      // }
                                      // Scaffold.of(context).closeDrawer();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: Get.size.width * 0.1,
                                      decoration: dashboardController
                                                  .transferOnTap.value ==
                                              AppText.bondCostCalculator
                                          ? BoxDecoration(
                                              color: dashboardController
                                                          .transferOnTap
                                                          .value ==
                                                      AppText.bondCostCalculator
                                                  ? AppColors.white
                                                  : AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            )
                                          : null,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Labels(
                                            text: AppText.bondCostCalculator,
                                            color: dashboardController
                                                        .transferOnTap.value ==
                                                    AppText.bondCostCalculator
                                                ? AppColors.primaryColor
                                                : AppColors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: Get.size.width * 0.03,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Obx(
                                  () => GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () async {
                                      dashboardController.transferOnTap.value =
                                          AppText.bondRepaymentCalculator;
                                      homeController.tab.value = 2;
                                      Get.back();
                                      //
                                      // final Uri url = Uri.parse(
                                      //     'https://cbilaw.co.za/fields-of-expertise/property-law-conveyancing/why-appoint-us/');
                                      // if (!await launchUrl(url)) {
                                      //   throw Exception(
                                      //       'Could not launch $url');
                                      // }
                                      // Scaffold.of(context).closeDrawer();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: Get.size.width * 0.1,
                                      decoration: dashboardController
                                                  .transferOnTap.value ==
                                              AppText.bondRepaymentCalculator
                                          ? BoxDecoration(
                                              color: dashboardController
                                                          .transferOnTap
                                                          .value ==
                                                      AppText
                                                          .bondRepaymentCalculator
                                                  ? AppColors.white
                                                  : AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            )
                                          : null,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Labels(
                                            text:
                                                AppText.bondRepaymentCalculator,
                                            color: dashboardController
                                                        .transferOnTap.value ==
                                                    AppText
                                                        .bondRepaymentCalculator
                                                ? AppColors.primaryColor
                                                : AppColors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: Get.size.width * 0.03,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //     horizontal: 12.0,
                              //   ),
                              //   child: Obx(
                              //     () => GestureDetector(
                              //       behavior: HitTestBehavior.translucent,
                              //       onTap: () {
                              //         dashboardController.transferOnTap
                              //             .value = AppText.faqs;
                              //       },
                              //       child: Container(
                              //         width: double.infinity,
                              //         height: Get.size.width * 0.1,
                              //         decoration: dashboardController
                              //                     .transferOnTap.value ==
                              //                 AppText.faqs
                              //             ? BoxDecoration(
                              //                 color: dashboardController
                              //                             .transferOnTap
                              //                             .value ==
                              //                         AppText.faqs
                              //                     ? AppColors.white
                              //                     : AppColors.primaryColor,
                              //                 borderRadius:
                              //                     BorderRadius.circular(10.0),
                              //               )
                              //             : null,
                              //         child: Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Padding(
                              //               padding: const EdgeInsets.only(
                              //                   left: 10.0),
                              //               child: Labels(
                              //                 text: AppText.faqs,
                              //                 color: dashboardController
                              //                             .transferOnTap
                              //                             .value ==
                              //                         AppText.faqs
                              //                     ? AppColors.primaryColor
                              //                     : AppColors.white,
                              //                 fontWeight: FontWeight.w600,
                              //                 fontSize: Get.size.width * 0.03,
                              //               ),
                              //             ),
                              //             dashboardController
                              //                         .transferOnTap.value ==
                              //                     AppText.faqs
                              //                 ? PopupMenuButton(
                              //                     shape:
                              //                         const RoundedRectangleBorder(
                              //                       borderRadius:
                              //                           BorderRadius.all(
                              //                         Radius.circular(14.0),
                              //                       ),
                              //                     ),
                              //                     padding: EdgeInsets.zero,
                              //                     icon: const Icon(
                              //                         Icons.keyboard_arrow_down,
                              //                         color: AppColors
                              //                             .primaryColor),
                              //                     itemBuilder:
                              //                         (BuildContext context) =>
                              //                             [
                              //                       PopupMenuItem(
                              //                         child: const Labels(
                              //                             text: "Seller"),
                              //                         onTap: () async {
                              //                           final Uri url = Uri.parse(
                              //                               'https://cbilaw.co.za/fields-of-expertise/property-law-conveyancing/faqs/seller/');
                              //                           if (!await launchUrl(
                              //                               url)) {
                              //                             throw Exception(
                              //                                 'Could not launch $url');
                              //                           }
                              //                           Scaffold.of(context)
                              //                               .closeDrawer();
                              //                         },
                              //                       ),
                              //                       PopupMenuItem(
                              //                         onTap: () async {
                              //                           final Uri url = Uri.parse(
                              //                               'https://cbilaw.co.za/fields-of-expertise/property-law-conveyancing/faqs/seller-2/');
                              //                           if (!await launchUrl(
                              //                           url)) {
                              //                           throw Exception(
                              //                           'Could not launch $url');
                              //                           }
                              //                           Scaffold.of(context)
                              //                               .closeDrawer();
                              //                         },
                              //                         child: const Labels(
                              //                             text: "Purchaser"),
                              //                       )
                              //                     ],
                              //                   )
                              //                 : Container(),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //     horizontal: 12.0,
                              //   ),
                              //   child: Obx(
                              //     () => GestureDetector(
                              //       behavior: HitTestBehavior.translucent,
                              //       onTap: () async {
                              //         dashboardController
                              //                 .transferOnTap.value =
                              //             AppText.propertyTransferProcess;
                              //
                              //         final Uri url = Uri.parse(
                              //             'https://cbilaw.co.za/fields-of-expertise/property-law-conveyancing/property-transfer-process/');
                              //         if (!await launchUrl(url)) {
                              //           throw Exception(
                              //               'Could not launch $url');
                              //         }
                              //         Scaffold.of(context).closeDrawer();
                              //       },
                              //       child: Container(
                              //         width: double.infinity,
                              //         height: Get.size.width * 0.1,
                              //         decoration: dashboardController
                              //                     .transferOnTap.value ==
                              //                 AppText.propertyTransferProcess
                              //             ? BoxDecoration(
                              //                 color: dashboardController
                              //                             .transferOnTap
                              //                             .value ==
                              //                         AppText
                              //                             .propertyTransferProcess
                              //                     ? AppColors.white
                              //                     : AppColors.primaryColor,
                              //                 borderRadius:
                              //                     BorderRadius.circular(10.0),
                              //               )
                              //             : null,
                              //         child: Row(
                              //           children: [
                              //             const SizedBox(width: 10),
                              //             Labels(
                              //               text:
                              //                   AppText.propertyTransferProcess,
                              //               color: dashboardController
                              //                           .transferOnTap
                              //                           .value ==
                              //                       AppText
                              //                           .propertyTransferProcess
                              //                   ? AppColors.primaryColor
                              //                   : AppColors.white,
                              //               fontWeight: FontWeight.w600,
                              //               fontSize: Get.size.width * 0.03,
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Divider(
                //   endIndent: Get.size.width * 0.1,
                //   indent: Get.size.width * 0.1,
                //   color: AppColors.grey.withOpacity(0.9),
                // ),
                // DashBoardMenuWidget(
                //   titleName: AppText.debtCollection,
                //   onTap: () async {
                //     final Uri url = Uri.parse(
                //         'https://cbilaw.co.za/fields-of-expertise/debt-collection/');
                //     if (!await launchUrl(url)) {
                //       throw Exception('Could not launch $url');
                //     }
                //     Scaffold.of(context).closeDrawer();
                //   },
                // ),
                // DashBoardMenuWidget(
                //   titleName: AppText.litigation,
                //   onTap: () async {
                //     final Uri url = Uri.parse(
                //         'https://cbilaw.co.za/fields-of-expertise/litigation/');
                //     if (!await launchUrl(url)) {
                //       throw Exception('Could not launch $url');
                //     }
                //     Scaffold.of(context).closeDrawer();
                //   },
                // ),
                // DashBoardMenuWidget(
                //   titleName: AppText.estatesEstatePlanning,
                //   onTap: () async {
                //     final Uri url = Uri.parse(
                //         'https://cbilaw.co.za/fields-of-expertise/estates-estate-planning/');
                //     if (!await launchUrl(url)) {
                //       throw Exception('Could not launch $url');
                //     }
                //     Scaffold.of(context).closeDrawer();
                //   },
                // ),
                DashBoardMenuWidget(
                  titleName: AppText.contactUs,
                  onTap: () {
                    Get.to(() => ContactScreen());
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                SizedBox(height: Get.size.width * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
