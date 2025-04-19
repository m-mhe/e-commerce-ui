import 'package:general_ecommerce_client_app/state_holders/flash_sale_categories_controller.dart';
import 'package:general_ecommerce_client_app/state_holders/flash_sale_timer_controller.dart';
import 'package:general_ecommerce_client_app/state_holders/otp_timer_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpTimerController());
    Get.put(FlashSaleTimerController());
    Get.put(FlashSaleCategoriesController());
  }
}
