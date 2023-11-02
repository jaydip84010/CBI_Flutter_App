import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final GlobalKey<ScaffoldState> key = GlobalKey();
  RxInt tab = 0.obs;
}
