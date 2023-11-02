import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BccController extends GetxController {
  TextEditingController bccAmount = TextEditingController();

  RxDouble conveyFee = 0.0.obs;
  RxDouble dEEDSOFFICE = 0.0.obs;

  RxDouble postagesAndPetties = 0.0.obs;
  RxDouble deedsOfficeSearches = 0.00.obs;
  RxDouble electronicGenerationFee = 0.0.obs;
  RxDouble documentGenerationFee = 0.0.obs;
  RxDouble stordocFee = 0.0.obs;
  RxDouble totalBCC = 0.0.obs;

  RxString approximateBcc = '0'.obs;

  void totalBccValues() {
    double sum = conveyFee.value +
        postagesAndPetties.value +
        deedsOfficeSearches.value +
        electronicGenerationFee.value +
        documentGenerationFee.value +
        stordocFee.value;

    double vat = sum * 0.15;
    totalBCC.value = vat + sum + dEEDSOFFICE.value;
  }

  ///fix Amount
  void fixAmount() {
    postagesAndPetties.value = 980.00;
    deedsOfficeSearches.value = 300.00;
    electronicGenerationFee.value = 1150.00;
    documentGenerationFee.value = 750.00;
    stordocFee.value = 795.00;
  }

  void bccCalculateValues() {
    int priceBcc = int.tryParse(bccAmount.text) ?? 0;
    approximateBcc.value = bccAmount.text;

    if (priceBcc > 0 && priceBcc <= 100000) {
      conveyFee.value = 7110.00;
      dEEDSOFFICE.value = 496.00;
      fixAmount();
    } else if (priceBcc > 100000 && priceBcc <= 150000) {
      conveyFee.value = 8085.00;
      dEEDSOFFICE.value = 496.00;
      fixAmount();
    } else if (priceBcc > 150000 && priceBcc <= 200000) {
      conveyFee.value = 9060.00;
      dEEDSOFFICE.value = 642.00;
      fixAmount();
    } else if (priceBcc > 200000 && priceBcc <= 250000) {
      conveyFee.value = 10035.00;
      dEEDSOFFICE.value = 642.00;
      fixAmount();
    } else if (priceBcc > 250000 && priceBcc <= 325000) {
      if (priceBcc > 250000 && priceBcc <= 300000) {
        conveyFee.value = 11010.00;
        dEEDSOFFICE.value = 642.00;
        fixAmount();
      } else if (priceBcc > 300000 && priceBcc <= 325000) {
        conveyFee.value = 11985.00;
        dEEDSOFFICE.value = 800.00;
        fixAmount();
      }
    } else if (priceBcc > 325000 && priceBcc <= 400000) {
      conveyFee.value = 12960.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (priceBcc > 400000 && priceBcc <= 450000) {
      conveyFee.value = 13935.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (priceBcc > 450000 && priceBcc <= 500000) {
      conveyFee.value = 14910.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (priceBcc > 500000 && priceBcc <= 600000) {
      conveyFee.value = 16795.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (priceBcc > 600000 && priceBcc <= 700000) {
      conveyFee.value = 18680.00;
      dEEDSOFFICE.value = 1126.00;
      fixAmount();
    } else if (priceBcc > 700000 && priceBcc <= 800000) {
      conveyFee.value = 20565.00;
      dEEDSOFFICE.value = 1126.00;
      fixAmount();
    } else if (priceBcc > 800000 && priceBcc <= 900000) {
      conveyFee.value = 22450.00;
      dEEDSOFFICE.value = 1293.00;
      fixAmount();
    } else if (priceBcc > 900000 && priceBcc <= 1000000) {
      conveyFee.value = 24335.00;
      dEEDSOFFICE.value = 1293.00;
      fixAmount();
    } else if (priceBcc > 1000000 && priceBcc <= 1200000) {
      conveyFee.value = 26220.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
    } else if (priceBcc > 1200000 && priceBcc <= 1400000) {
      conveyFee.value = 28105.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
    } else if (priceBcc > 1400000 && priceBcc <= 1600000) {
      conveyFee.value = 29990.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
    } else if (priceBcc > 1600000 && priceBcc <= 1800000) {
      conveyFee.value = 31875.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
    } else if (priceBcc > 1800000 && priceBcc <= 2000000) {
      conveyFee.value = 33760.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
    } else if (priceBcc > 2000000 && priceBcc <= 2200000) {
      conveyFee.value = 35645.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 2200000 && priceBcc <= 2400000) {
      conveyFee.value = 37530.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 2400000 && priceBcc <= 2600000) {
      conveyFee.value = 39415.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 2600000 && priceBcc <= 2800000) {
      conveyFee.value = 41300.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 2800000 && priceBcc <= 3000000) {
      conveyFee.value = 43185.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 3000000 && priceBcc <= 3200000) {
      conveyFee.value = 45070.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 3200000 && priceBcc <= 3400000) {
      conveyFee.value = 46955.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 3400000 && priceBcc <= 3600000) {
      conveyFee.value = 48840.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 3600000 && priceBcc <= 3800000) {
      conveyFee.value = 50725.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 3800000 && priceBcc <= 4000000) {
      conveyFee.value = 52610.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
    } else if (priceBcc > 4000000 && priceBcc <= 4200000) {
      conveyFee.value = 54495.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
    } else if (priceBcc > 4200000 && priceBcc <= 4400000) {
      conveyFee.value = 56380.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
    } else if (priceBcc > 4400000 && priceBcc <= 4600000) {
      conveyFee.value = 58265.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
    } else if (priceBcc > 4600000 && priceBcc <= 4800000) {
      conveyFee.value = 60150.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
    } else if (priceBcc > 4800000 && priceBcc <= 5000000) {
      conveyFee.value = 62035.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
    } else if (priceBcc > 5000000 && priceBcc <= 6000000) {
      conveyFee.value = 66785.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
    } else if (priceBcc > 6000000 && priceBcc <= 7000000) {
      conveyFee.value = 71535.00;
      dEEDSOFFICE.value = 2909.00;
      fixAmount();
    } else if (priceBcc > 7000000 && priceBcc <= 8000000) {
      conveyFee.value = 76285.00;
      dEEDSOFFICE.value = 2909.00;
      fixAmount();
    } else if (priceBcc > 8000000 && priceBcc <= 9000000) {
      conveyFee.value = 81035.00;
      dEEDSOFFICE.value = 3401.00;
      fixAmount();
    } else if (priceBcc > 9000000 && priceBcc <= 10000000) {
      conveyFee.value = 85785.00;
      dEEDSOFFICE.value = 3401.00;
      fixAmount();
    }
  }
}
