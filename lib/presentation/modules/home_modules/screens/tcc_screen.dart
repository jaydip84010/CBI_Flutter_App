import 'package:cbi/data/models/pdfView.dart';
import 'package:cbi/presentation/controllers/tcc.controller.dart';
import 'package:cbi/presentation/modules/home_modules/screens/tcc_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

import '../../../common_widget/costom_textfiled.dart';
import '../../../common_widget/labels.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text.dart';
import '../widgets/costom_btn.dart';
import '../widgets/result_menu_widget.dart';

class TccScreen extends StatelessWidget {
  TccScreen({super.key});

  final TccController tccController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          Center(
            child: Labels(
              text: AppText.totalTransferCosts,
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
                text: AppText.transferDetails,
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
            controller: tccController.tccAmount,
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
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
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
                if (tccController.tccAmount.text.isNotEmpty) {
                  tccController.calculateValues();
                  tccController.totalTransferCostsTable();
                  FocusScope.of(context).unfocus();
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
                              title: AppText.transferAttorneyFees,
                              amount: tccController.transferAttorneyFees.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.postagesAndPetties,
                              amount: tccController.postagesAndPetties.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.feeForObtainingTransferDut,
                              amount: tccController.deedsOfficeFees.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.ratesClearanceFees,
                              amount: tccController.ratesClearanceFees.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.electronicGenerationFee,
                              amount:
                                  tccController.electronicGenerationFee.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.fica,
                              amount: tccController.fica.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.deedsOfficeSearches,
                              amount: tccController.deedsOfficeSearches.value,
                            ),
                            ResultMenuWidget(
                              title: AppText.deedOffice,
                              amount: tccController.dEEDSOFFICE.value,
                            ),
                            tccController.tccAmount.text.isNotEmpty
                                ? int.parse(tccController.tccAmount.text) >
                                        1100000
                                    ? ResultMenuWidget(
                                        title: AppText.transferDuty,
                                        amount:
                                            tccController.transferDuty.value,
                                      )
                                    : Container()
                                : Container()
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Labels(
                              text: AppText.totalTransferCosts,
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
                                "R${tccController.totalTransferCosts.value.toStringAsFixed(2)}",
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
            () => tccController.totalTransferCosts.value != 0.00
                ? Padding(
                    padding: EdgeInsets.only(top: Get.size.width * 0.02),
                    child: Row(
                      children: [
                        Labels(
                          text: AppText
                              .approximateTransferQuotationForPurchasePriceAt,
                          color: AppColors.black,
                          fontSize: Get.size.width * 0.028,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 6),
                        Obx(
                          () => Labels(
                            text: "R${tccController.approximate.value}",
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
                  if (tccController.tccAmount.text.isNotEmpty &&
                      tccController.totalTransferCosts.value != 0.00) {
                    PdfViewModel pdfViewModel = PdfViewModel(
                        purchasePrice:
                            double.parse(tccController.tccAmount.text),
                        transferAttorneyFees:
                            tccController.transferAttorneyFees.value,
                        postgesAndPetties:
                            tccController.postagesAndPetties.value,
                        deedsOfficeFees: tccController.deedsOfficeFees.value,
                        electronicGenerationFee:
                            tccController.electronicGenerationFee.value,
                        ficaRegistrationFee: tccController.fica.value,
                        ratesClearanceFee:
                            tccController.ratesClearanceFees.value,
                        transferDutye: tccController.transferDuty.value,
                        deedsOfficeSearchFee:
                            tccController.deedsOfficeSearches.value,
                        total: tccController.totalTransferCosts.value);
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
                              TCCPDFViewPage.generateTransactionPDf(
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
                  AppImages.download,
                  height: Get.size.width * 0.16,
                  width: Get.size.width * 0.16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (tccController.tccAmount.text.isNotEmpty &&
                      tccController.totalTransferCosts.value != 0.00) {
                    PdfViewModel pdfViewModel = PdfViewModel(
                        purchasePrice:
                            double.parse(tccController.tccAmount.text),
                        transferAttorneyFees:
                            tccController.transferAttorneyFees.value,
                        postgesAndPetties:
                            tccController.postagesAndPetties.value,
                        deedsOfficeFees: tccController.deedsOfficeFees.value,
                        electronicGenerationFee:
                            tccController.electronicGenerationFee.value,
                        ficaRegistrationFee: tccController.fica.value,
                        ratesClearanceFee:
                            tccController.ratesClearanceFees.value,
                        transferDutye: tccController.transferDuty.value,
                        deedsOfficeSearchFee:
                            tccController.deedsOfficeSearches.value,
                        total: tccController.totalTransferCosts.value);
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
                              TCCPDFViewPage.generateTransactionPDf(
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
                  if (tccController.tccAmount.text.isNotEmpty &&
                      tccController.totalTransferCosts.value != 0.00) {
                    PdfViewModel pdfViewModel = PdfViewModel(
                        purchasePrice:
                            double.parse(tccController.tccAmount.text),
                        transferAttorneyFees:
                            tccController.transferAttorneyFees.value,
                        postgesAndPetties:
                            tccController.postagesAndPetties.value,
                        deedsOfficeFees: tccController.deedsOfficeFees.value,
                        electronicGenerationFee:
                            tccController.electronicGenerationFee.value,
                        ficaRegistrationFee: tccController.fica.value,
                        ratesClearanceFee:
                            tccController.ratesClearanceFees.value,
                        transferDutye: tccController.transferDuty.value,
                        deedsOfficeSearchFee:
                            tccController.deedsOfficeSearches.value,
                        total: tccController.totalTransferCosts.value);
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
                              TCCPDFViewPage.generateTransactionPDf(
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
                  if (tccController.tccAmount.text.isNotEmpty &&
                      tccController.totalTransferCosts.value != 0.00) {
                    PdfViewModel pdfViewModel = PdfViewModel(
                        transferDutyReceiptFee: 0.00,
                        purchasePrice:
                            double.parse(tccController.tccAmount.text),
                        transferAttorneyFees:
                            tccController.transferAttorneyFees.value,
                        postgesAndPetties:
                            tccController.postagesAndPetties.value,
                        deedsOfficeFees: tccController.deedsOfficeFees.value,
                        electronicGenerationFee:
                            tccController.electronicGenerationFee.value,
                        ficaRegistrationFee: tccController.fica.value,
                        ratesClearanceFee:
                            tccController.ratesClearanceFees.value,
                        transferDutye: tccController.transferDuty.value,
                        deedsOfficeSearchFee:
                            tccController.deedsOfficeSearches.value,
                        total: tccController.totalTransferCosts.value);
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
                              TCCPDFViewPage.generateTransactionPDf(
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
