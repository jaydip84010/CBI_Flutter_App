import 'package:cbi/presentation/common_widget/labels.dart';
import 'package:cbi/presentation/utils/app_colors.dart';
import 'package:cbi/presentation/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widget/costom_textfiled.dart';
import '../../home_modules/widgets/costom_btn.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtSubject = TextEditingController();
  final TextEditingController txtMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.size.width * 0.06,
            ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.size.width * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Center(
                        child: Labels(
                          text: AppText.contact,
                          fontSize: Get.size.width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Container()
                    ],
                  ),
                  SizedBox(height: Get.size.width * 0.03),
                  const Divider(color: AppColors.grey),
                  SizedBox(height: Get.size.width * 0.05),

                  const Labels(
                    text: AppText.name,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: Get.size.width * 0.014),

                  CostomTextFiled(
                    cursorColor: AppColors.black,
                    controller: txtName,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: Get.size.width * 0.06),
                  const Labels(
                    text: AppText.email,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: Get.size.width * 0.014),

                  CostomTextFiled(
                    cursorColor: AppColors.black,
                    controller: txtEmail,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: Get.size.width * 0.06),
                  const Labels(
                    text: AppText.subject,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: Get.size.width * 0.014),

                  CostomTextFiled(
                    cursorColor: AppColors.black,
                    controller: txtSubject,
                    textInputAction: TextInputAction.next,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10),
                    maxLines: 3,
                  ),
                  SizedBox(height: Get.size.width * 0.06),
                  const Labels(
                    text: AppText.message,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: Get.size.width * 0.014),

                  CostomTextFiled(
                    textInputAction: TextInputAction.done,
                    cursorColor: AppColors.black,
                    controller: txtMessage,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 10),
                    maxLines: 3,
                  ),
                  SizedBox(height: Get.size.width * 0.1),
                  Center(
                    child: CustomBtn(
                      btnName: AppText.submit,
                      textColor: AppColors.white,
                      hideGradient: true,
                      height: Get.size.width * 0.14,
                      width: Get.size.width * 0.5,
                      onTap: () async {
                        FocusScope.of(context).unfocus();

                        if (txtName.text.isNotEmpty &&
                            txtEmail.text.isNotEmpty &&
                            txtSubject.text.isNotEmpty &&
                            txtMessage.text.isNotEmpty) {
                          if ((!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(txtEmail.text))) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Labels(text: 'Email Address is not valid'),
                              margin: EdgeInsets.all(20),
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.redAccent,
                            ));
                          } else {
                            var url =
                                'mailto:carbonsoft101@gmail.com?subject=${txtSubject.text}&body=${txtMessage.text}';
                            if (await launch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Labels(text: 'All fields are required'),
                            margin: EdgeInsets.all(20),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.redAccent,
                          ));
                        }
                      },
                    ),
                  ),
                  // ContactAsWidget(
                  //   height: Get.size.width * 0.2,
                  //   width: double.infinity,
                  //   indexNo: '01',
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Icon(
                  //         Icons.home_outlined,
                  //         size: Get.size.width * 0.14,
                  //         color: AppColors.primaryColor,
                  //         shadows: const [
                  //           BoxShadow(
                  //             color: AppColors.black,
                  //             blurRadius: 3,
                  //           ),
                  //         ],
                  //       ),
                  //       Labels(
                  //         text: AppText.headOffice,
                  //         color: AppColors.primaryColor,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: Get.size.width * 0.05,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: Get.size.width * 0.04),
                  // ContactAsWidget(
                  //   height: Get.size.width * 1,
                  //   width: double.infinity,
                  //   indexNo: '02',
                  //   child: Column(
                  //     children: [
                  //       SizedBox(height: Get.size.width * 0.03),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           Icon(
                  //             Icons.home_outlined,
                  //             size: Get.size.width * 0.14,
                  //             color: AppColors.primaryColor,
                  //             shadows: const [
                  //               BoxShadow(
                  //                 color: AppColors.black,
                  //                 blurRadius: 3,
                  //               ),
                  //             ],
                  //           ),
                  //           Labels(
                  //             text: AppText.westrandOffice,
                  //             color: AppColors.primaryColor,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: Get.size.width * 0.05,
                  //           )
                  //         ],
                  //       ),
                  //       SizedBox(height: Get.size.width * 0.01),
                  //       Divider(
                  //         endIndent: Get.size.width * 0.08,
                  //         indent: Get.size.width * 0.08,
                  //       ),
                  //       SizedBox(height: Get.size.width * 0.02),
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(
                  //             vertical: 8.0, horizontal: 14.0),
                  //         width: double.infinity,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: AppColors.primaryColor.withOpacity(0.1)),
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //             vertical: 10.0,
                  //             horizontal: 20.0,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Labels(
                  //                 text: AppText.address,
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: Get.size.width * 0.04,
                  //                 color: AppColors.primaryColor,
                  //               ),
                  //               const SizedBox(height: 4),
                  //               Labels(
                  //                 fontSize: Get.size.width * 0.027,
                  //                 text:
                  //                     'Ground Floor,Gateview House Bloc A1,Constantia Office Park,Vlakhaas Avenue,Weltevredenpark,Roodepoort',
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(
                  //             vertical: 8.0, horizontal: 14.0),
                  //         width: double.infinity,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: AppColors.primaryColor.withOpacity(0.1)),
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //             vertical: 10.0,
                  //             horizontal: 20.0,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Labels(
                  //                 text: AppText.busineesHours,
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: Get.size.width * 0.04,
                  //                 color: AppColors.primaryColor,
                  //               ),
                  //               const SizedBox(height: 4),
                  //               Labels(
                  //                 fontSize: Get.size.width * 0.027,
                  //                 text: 'Monday-Friday: 8am - 4:30pm',
                  //               ),
                  //               const SizedBox(height: 4),
                  //               Labels(
                  //                 fontSize: Get.size.width * 0.027,
                  //                 text: 'Saturday: on Appintment Only',
                  //               ),
                  //               const SizedBox(height: 4),
                  //               Labels(
                  //                 fontSize: Get.size.width * 0.027,
                  //                 text: 'Sanday: on Appintment Only',
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(
                  //             vertical: 8.0, horizontal: 14.0),
                  //         width: double.infinity,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: AppColors.primaryColor.withOpacity(0.1)),
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //             vertical: 10.0,
                  //             horizontal: 20.0,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Labels(
                  //                 text: AppText.phone,
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: Get.size.width * 0.04,
                  //                 color: AppColors.primaryColor,
                  //               ),
                  //               const SizedBox(height: 4),
                  //               Labels(
                  //                 fontSize: Get.size.width * 0.027,
                  //                 text: 'Office:(010)880 5409',
                  //               ),
                  //               const SizedBox(height: 4),
                  //               Labels(
                  //                 fontSize: Get.size.width * 0.027,
                  //                 text: 'westrand@bassoninc.co.za',
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: Get.size.width * 0.03),
                  // ContactAsWidget(
                  //   height: Get.size.width * 0.2,
                  //   width: double.infinity,
                  //   indexNo: '03',
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Icon(
                  //         Icons.home_outlined,
                  //         size: Get.size.width * 0.14,
                  //         color: AppColors.primaryColor,
                  //         shadows: const [
                  //           BoxShadow(
                  //             color: AppColors.black,
                  //             blurRadius: 3,
                  //           ),
                  //         ],
                  //       ),
                  //       Labels(
                  //         text: AppText.northrandOffice,
                  //         color: AppColors.primaryColor,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: Get.size.width * 0.05,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: Get.size.width * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
