import 'package:cbi/presentation/controllers/brp_controller.dart';
import 'package:cbi/presentation/modules/home_modules/screens/brp_pdf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

import '../../../common_widget/costom_textfiled.dart';
import '../../../common_widget/labels.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text.dart';
import '../widgets/costom_btn.dart';
import '../widgets/result_menu_widget.dart';

class BrpScreen extends StatelessWidget {
  const BrpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brpController = Get.put(BrpController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(

        children: [
          Center(
            child: Labels(
              text: AppText.bondRepaymentCalculator,
              fontSize: Get.size.width * 0.035,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: Get.size.width * 0.001),
          const Divider(color: AppColors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Labels(
                text: AppText.bondAmount,
                fontWeight: FontWeight.w600,
                fontSize: Get.size.width * 0.03,
              ),
              const Icon(
                Icons.info_outline,
                color: AppColors.primaryColor,
              )
            ],
          ),
          SizedBox(height: Get.size.width * 0.01),
          CostomTextFiled(
            keyboardType: TextInputType.number,
            controller: brpController.brpBondAmount,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12.0),
              child: Labels(
                text: "R",
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
                fontSize: Get.size.width * 0.05,
              ),
            ),
            prefixIconShow: true,
          ),
          SizedBox(height: Get.size.width * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Labels(
                text: AppText.yearsToRepay,
                fontWeight: FontWeight.w600,
                fontSize: Get.size.width * 0.03,

              ),
              const Icon(
                Icons.info_outline,
                color: AppColors.primaryColor,
              )
            ],
          ),
          SizedBox(height: Get.size.width * 0.01),
          Container(
            height: Get.size.width * 0.13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                )),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBtn(
                    onTap: () {
                      brpController.loanTermYears.value = 5;
                    },
                    height: Get.size.width * 0.16,
                    width: Get.size.width * 0.16,
                    radius: 14,
                    hideGradient: brpController.loanTermYears.value == 5
                        ? true
                        : false,
                    btnName: "5",
                    textColor: brpController.loanTermYears.value == 5
                        ? AppColors.white
                        : AppColors.black,
                  ),
                  CustomBtn(
                    onTap: () {
                      brpController.loanTermYears.value = 10;
                    },
                    height: Get.size.width * 0.16,
                    width: Get.size.width * 0.16,
                    radius: 14,
                    hideGradient:
                        brpController.loanTermYears.value == 10
                            ? true
                            : false,
                    btnName: "10",
                    textColor: brpController.loanTermYears.value == 10
                        ? AppColors.white
                        : AppColors.black,
                  ),
                  CustomBtn(
                    onTap: () {
                      brpController.loanTermYears.value = 20;
                    },
                    height: Get.size.width * 0.16,
                    width: Get.size.width * 0.16,
                    radius: 14,
                    hideGradient:
                        brpController.loanTermYears.value == 20
                            ? true
                            : false,
                    btnName: "20",
                    textColor: brpController.loanTermYears.value == 20
                        ? AppColors.white
                        : AppColors.black,
                  ),
                  CustomBtn(
                    onTap: () {
                      brpController.loanTermYears.value = 25;
                    },
                    height: Get.size.width * 0.16,
                    width: Get.size.width * 0.16,
                    radius: 14,
                    hideGradient:
                        brpController.loanTermYears.value == 25
                            ? true
                            : false,
                    btnName: "25",
                    textColor: brpController.loanTermYears.value == 25
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Get.size.width * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Labels(
                text: AppText.interestRate,
                fontWeight: FontWeight.w600,
                fontSize: Get.size.width * 0.03,

              ),
              const Icon(
                Icons.info_outline,
                color: AppColors.primaryColor,
              )
            ],
          ),
          SizedBox(height: Get.size.width * 0.01),
          CostomTextFiled(
            keyboardType: TextInputType.number,
            controller: brpController.brpInterestRate,
            prefixIcon: const Icon(Icons.percent,
                color: AppColors.primaryColor),
            prefixIconShow: true,
          ),
          SizedBox(height: Get.size.width * 0.03),
          Center(
            child: CustomBtn(
              onTap: () {
                if (brpController.brpBondAmount.text.isNotEmpty &&
                    brpController.brpInterestRate.text.isNotEmpty) {
                  brpController.calculateMonthlyPayment();
                  FocusScope.of(context).unfocus();
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text('Enter bond details'),
                    margin: EdgeInsets.all(20),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.redAccent,
                  ));
                }
              },
              height: Get.size.width * 0.12,
              width: Get.size.width * 0.4,
              radius: 10.0,
              hideGradient: true,
              btnName: AppText.calculator,
              textColor: AppColors.white,
            ),
          ),
          SizedBox(height: Get.size.width * 0.02),
           Labels(
            text: AppText.results,
            fontWeight: FontWeight.w600,
            fontSize: Get.size.width * 0.03,

          ),
          SizedBox(height: Get.size.width * 0.02),
          Container(
            height: Get.size.width * 0.345,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 9.0,
                    horizontal: 20.0,
                  ),
                  child: Obx(
                    () => Column(
                      children: [
                        ResultMenuWidget(
                          title: AppText.interestRepayment,
                          amount: brpController.interestPayment.value,
                        ),
                        ResultMenuWidget(
                          title: AppText.totalLoanRepayment,
                          amount: brpController.totalRepayAmount.value,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  height: Get.size.width * 0.1,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [BoxShadow(color: AppColors.black)],
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradientSecondary,
                        AppColors.gradientPrimary,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Labels(
                          text: AppText.totalMonthlyCost,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: Get.size.width * 0.034,
                        ),
                        Obx(
                          () => Labels(
                            text:
                                'R${brpController.monthlyPayment.value.toStringAsFixed(2)}',
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: Get.size.width * 0.036,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          brpController.monthlyPayment.value != 0.00
              ? Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Row(
                  children: [
                    Labels(
                      text: AppText.approximateQuotationForBondAmount,
                      color: AppColors.black,
                      fontSize: Get.size.width * 0.028,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(width: 6),
                    Obx(
                      () => Labels(
                        text:
                            "R${brpController.brpApproximate.value}",
                        color: AppColors.primaryColor,
                        fontSize: Get.size.width * 0.029,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
              : Container(),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (brpController.brpBondAmount.text.isNotEmpty &&
                      brpController.brpInterestRate.text.isNotEmpty &&
                      brpController.monthlyPayment.value != 0.00) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfPreview(
                          canDebug: false,
                          canChangePageFormat: false,
                          canChangeOrientation: false,
                          allowPrinting: true,
                          allowSharing: false,
                          build: (context) =>
                              BRPPDFViewPage.generateTransactionPDf(
                            purchasePrice:
                                double.parse(brpController.brpBondAmount.text),
                            interestRepayment:
                                brpController.interestPayment.value,
                            totalLoanRepayment:
                                brpController.totalRepayAmount.value,
                            totalMonthlyCost:
                                brpController.monthlyPayment.value,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter bond details'),
                      margin: EdgeInsets.all(20),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                child: Image.asset(
                  AppImages.download,
                  height: Get.size.width * 0.16,
                  width: Get.size.width * 0.16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (brpController.brpBondAmount.text.isNotEmpty &&
                      brpController.brpInterestRate.text.isNotEmpty &&
                      brpController.monthlyPayment.value != 0.00) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfPreview(
                          canDebug: false,
                          canChangePageFormat: false,
                          canChangeOrientation: false,
                          allowPrinting: true,
                          allowSharing: false,
                          build: (context) =>
                              BRPPDFViewPage.generateTransactionPDf(
                            purchasePrice:
                                double.parse(brpController.brpBondAmount.text),
                            interestRepayment:
                                brpController.interestPayment.value,
                            totalLoanRepayment:
                                brpController.totalRepayAmount.value,
                            totalMonthlyCost:
                                brpController.monthlyPayment.value,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter bond details'),
                      margin: EdgeInsets.all(20),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                child: Image.asset(
                  AppImages.print,
                  height: Get.size.width * 0.16,
                  width: Get.size.width * 0.16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (brpController.brpBondAmount.text.isNotEmpty &&
                      brpController.brpInterestRate.text.isNotEmpty &&
                      brpController.monthlyPayment.value != 0.00) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfPreview(
                          canDebug: false,
                          canChangePageFormat: false,
                          canChangeOrientation: false,
                          allowPrinting: false,
                          allowSharing: true,
                          build: (context) =>
                              BRPPDFViewPage.generateTransactionPDf(
                            purchasePrice:
                                double.parse(brpController.brpBondAmount.text),
                            interestRepayment:
                                brpController.interestPayment.value,
                            totalLoanRepayment:
                                brpController.totalRepayAmount.value,
                            totalMonthlyCost:
                                brpController.monthlyPayment.value,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter bond details'),
                      margin: EdgeInsets.all(20),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                child: Image.asset(
                  AppImages.gmail,
                  height: Get.size.width * 0.16,
                  width: Get.size.width * 0.16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (brpController.brpBondAmount.text.isNotEmpty &&
                      brpController.brpInterestRate.text.isNotEmpty &&
                      brpController.monthlyPayment.value != 0.00) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfPreview(
                          canDebug: false,
                          canChangePageFormat: false,
                          canChangeOrientation: false,
                          allowPrinting: false,
                          allowSharing: true,
                          build: (context) =>
                              BRPPDFViewPage.generateTransactionPDf(
                            purchasePrice:
                                double.parse(brpController.brpBondAmount.text),
                            interestRepayment:
                                brpController.interestPayment.value,
                            totalLoanRepayment:
                                brpController.totalRepayAmount.value,
                            totalMonthlyCost:
                                brpController.monthlyPayment.value,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter bond details'),
                      margin: EdgeInsets.all(20),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                child: Image.asset(
                  AppImages.whatsApp,
                  height: Get.size.width * 0.16,
                  width: Get.size.width * 0.16,
                ),
              ),
            ],
          ),
          SizedBox(height: Get.size.width * 0.03),
        ],
      ),
    );
  }
}
