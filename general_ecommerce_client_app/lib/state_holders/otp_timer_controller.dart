import 'package:get/get.dart';

class OtpTimerController extends GetxController {
  int _remainingTime = 0;

  int get remainingTime => _remainingTime;

  Future<void> startTimer()async {
    for(_remainingTime = 30; _remainingTime != 0; --_remainingTime){
      await Future.delayed(Duration(seconds: 1));
      update();
    }
  }
}
