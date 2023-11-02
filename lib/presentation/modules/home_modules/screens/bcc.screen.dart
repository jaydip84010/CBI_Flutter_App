import 'package:cbi/data/models/pdfView.dart';
import 'package:cbi/presentation/controllers/bcc_controller.dart';
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
import 'bcc_pdf.dart';

class BccScreen extends StatelessWidget {
  const BccScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bccController = Get.put(BccController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(

        children: [
          Center(
            child: Labels(
              text: AppText.bondCostCalculator,
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
                text: AppText.bondDetails,
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
            controller: bccController.bccAmount,
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
          SizedBox(height: Get.size.width * 0.03),
          Center(
            child: CustomBtn(
              height: Get.size.width * 0.12,
              width: Get.size.width * 0.4,
              radius: 10.0,
              hideGradient: true,
              btnName: AppText.calculator,
              textColor: AppColors.white,
              onTap: () {
                if (bccController.bccAmount.text.isNotEmpty) {
                  bccController.bccCalculateValues();
                  bccController.totalBccValues();
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
            ),
          ),
          SizedBox(height: Get.size.width * 0.03),
           Labels(
            text: AppText.results,
            fontWeight: FontWeight.w600,
            fontSize: Get.size.width * 0.03,
          ),
          SizedBox(height: Get.size.width * 0.03),
          Container(
            height: Get.size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
                      ),
                      child: Obx(
                        () => Column(
                          children: [
                            ResultMenuWidget(
                              title: AppText.conveyFee,
                              amount: bccController.conveyFee.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.postagesAndPetties,
                              amount: bccController
                                  .postagesAndPetties.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.deedsOfficeSearches,
                              amount: bccController
                                  .deedsOfficeSearches.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.electronicGenerationFee,
                              amount: bccController
                                  .electronicGenerationFee.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.documentGenerationFee,
                              amount: bccController
                                  .documentGenerationFee.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.stordocFee,
                              amount: bccController.stordocFee.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.deedOffice,
                              amount: bccController.dEEDSOFFICE.value,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.size.width * 0.13,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Labels(
                              text: AppText.totalBondCosts,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Get.size.width * 0.034,
                            ),
                            const SizedBox(height: 6.0),
                            Labels(
                              text: AppText.inclVAT,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Get.size.width * 0.03,
                            ),
                          ],
                        ),
                        Obx(
                          () => Labels(
                            text:
                                "R${bccController.totalBCC.value.toStringAsFixed(2)}",
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
          Obx(
            () => bccController.totalBCC.value != 0.00
                ? Padding(
                    padding:
                        EdgeInsets.only(top: Get.size.width * 0.026),
                    child: Row(
                      children: [
                        Labels(
                          text: AppText
                              .approximateBondQuotationForBondAmountAt,
                          color: AppColors.black,
                          fontSize: Get.size.width * 0.028,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 6),
                        Obx(
                          () => Labels(
                            text:
                                "R${bccController.approximateBcc.value}",
                            color: AppColors.primaryColor,
                            fontSize: Get.size.width * 0.029,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (bccController.bccAmount.text.isNotEmpty &&
                      bccController.totalBCC.value != 0.00) {
                    PdfViewModel pdfViewModel = PdfViewModel(
                      purchasePrice: double.parse(bccController.bccAmount.text),
                      transferAttorneyFees: bccController.conveyFee.value,

                      postgesAndPetties: bccController.postagesAndPetties.value,

                      deedsOfficeFees: bccController.deedsOfficeSearches.value,
                      deedsOfficeSearchFee: 0.00,

                      electronicGenerationFee:
                          bccController.electronicGenerationFee.value,

                      ///
                      ficaRegistrationFee:
                          bccController.documentGenerationFee.value,
                      ratesClearanceFee: bccController.stordocFee.value,

                      transferDutyReceiptFee: 0.00,
                      total: bccController.totalBCC.value,

                      transferDutye: 0.00,
                    );
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
                              BccPDFViewPage.generateTransactionPDf(
                            pdfViewModel: pdfViewModel,
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
                  if (bccController.bccAmount.text.isNotEmpty &&
                      bccController.totalBCC.value != 0.00) {
                    PdfViewModel pdfViewModel = PdfViewModel(
                      purchasePrice: double.parse(bccController.bccAmount.text),
                      transferAttorneyFees: bccController.conveyFee.value,

                      postgesAndPetties: bccController.postagesAndPetties.value,

                      deedsOfficeFees: bccController.deedsOfficeSearches.value,
                      deedsOfficeSearchFee: 0.00,

                      electronicGenerationFee:
                          bccController.electronicGenerationFee.value,

                      ///
                      ficaRegistrationFee:
                          bccController.documentGenerationFee.value,
                      ratesClearanceFee: bccController.stordocFee.value,

                      transferDutyReceiptFee: 0.00,

                      transferDutye: 0.00,
                       total: bccController.totalBCC.value
                    );
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
                              BccPDFViewPage.generateTransactionPDf(
                            pdfViewModel: pdfViewModel,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter transfer details'),
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
                  if (bccController.bccAmount.text.isNotEmpty &&
                      bccController.totalBCC.value != 0.00) {
                    PdfViewModel pdfViewModel = PdfViewModel(
                      purchasePrice: double.parse(bccController.bccAmount.text),
                      transferAttorneyFees: bccController.conveyFee.value,

                      postgesAndPetties: bccController.postagesAndPetties.value,

                      deedsOfficeFees: bccController.deedsOfficeSearches.value,
                      deedsOfficeSearchFee: 0.00,

                      electronicGenerationFee:
                          bccController.electronicGenerationFee.value,

                      ///
                      ficaRegistrationFee:
                          bccController.documentGenerationFee.value,
                      ratesClearanceFee: bccController.stordocFee.value,

                      transferDutyReceiptFee: 0.00,

                      transferDutye: 0.00,
                      total: bccController.totalBCC.value,

                    );
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
                              BccPDFViewPage.generateTransactionPDf(
                            pdfViewModel: pdfViewModel,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter transfer details'),
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
                  if (bccController.bccAmount.text.isNotEmpty &&
                      bccController.totalBCC.value != 0.00) {
                    PdfViewModel pdfViewModel = PdfViewModel(
                      purchasePrice: double.parse(bccController.bccAmount.text),
                      transferAttorneyFees: bccController.conveyFee.value,

                      postgesAndPetties: bccController.postagesAndPetties.value,

                      deedsOfficeFees: bccController.deedsOfficeSearches.value,
                      deedsOfficeSearchFee: 0.00,

                      electronicGenerationFee:
                          bccController.electronicGenerationFee.value,

                      ///
                      ficaRegistrationFee:
                          bccController.documentGenerationFee.value,
                      ratesClearanceFee: bccController.stordocFee.value,

                      transferDutyReceiptFee: 0.00,

                      transferDutye: 0.00,
                      total: bccController.totalBCC.value,

                    );
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
                              BccPDFViewPage.generateTransactionPDf(
                            pdfViewModel: pdfViewModel,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter transfer details'),
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
