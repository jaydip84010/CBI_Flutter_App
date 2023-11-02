
import 'package:get/get.dart';
import '../utils/app_text.dart';

class DashboardController extends GetxController {
  RxString professionChoosed = ''.obs;
  RxString transferOnTap = AppText.transferCostCalculator.obs;
  RxBool titleTextColor = false.obs;
}
