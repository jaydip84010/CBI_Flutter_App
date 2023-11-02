import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrpController extends GetxController {
  TextEditingController brpBondAmount = TextEditingController();
  TextEditingController brpInterestRate = TextEditingController();

  RxInt loanTermYears = 5.obs;
  RxDouble monthlyPayment = 0.00.obs;
  RxDouble interestPayment = 0.00.obs;
  RxDouble totalRepayAmount = 0.00.obs;
  RxString brpApproximate = '0'.obs;

  void calculateMonthlyPayment() {
    double principal = double.tryParse(brpBondAmount.text) ?? 0;
    double interestRate = double.tryParse(brpInterestRate.text) ?? 0;
    brpApproximate.value = brpBondAmount.text;

    double monthlyInterestRate = interestRate / 100 / 12;
    double totalMonths = loanTermYears.value * 12;

    if (monthlyInterestRate == 0) {
      monthlyPayment.value = principal / totalMonths;
    } else {
      monthlyPayment.value = principal *
          (monthlyInterestRate * pow(1 + monthlyInterestRate, totalMonths)) /
          (pow(1 + monthlyInterestRate, totalMonths) - 1);
    }
    monthlyPayment.value =
        double.parse(monthlyPayment.value.toStringAsFixed(2));

    interestPayment.value = monthlyPayment.value * totalMonths - principal;
    interestPayment.value =
        double.parse(interestPayment.value.toStringAsFixed(2));
    totalRepayAmount.value = principal + interestPayment.value;
    totalRepayAmount.value =
        double.parse(totalRepayAmount.value.toStringAsFixed(2));
  }
}
