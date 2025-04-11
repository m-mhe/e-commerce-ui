import 'package:general_ecommerce_client_app/state_holders/otp_timer_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(OtpTimerController());
  }

}