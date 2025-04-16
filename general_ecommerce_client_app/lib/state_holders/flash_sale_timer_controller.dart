import 'package:get/get.dart';

class FlashSaleTimerController extends GetxController {
  int _remainingHour = 0;

  int get remainingHour => _remainingHour;

  int _remainingMinute = 0;

  int get remainingMinute => _remainingMinute;

  int _remainingSecond = 0;

  int get remainingSecond => _remainingSecond;

  Future<void> startTimer({
    required int remainingHour,
    required int remainingMinute,
    required int remainingSecond,
  }) async {
    _remainingHour = remainingHour;
    _remainingMinute = remainingMinute;
    _remainingSecond = remainingSecond;
    while (_remainingHour > 0 || _remainingMinute > 0 || _remainingSecond > 0) {
      await Future.delayed(Duration(seconds: 1));
      if (_remainingSecond > 0) {
        _remainingSecond--;
      } else if (_remainingMinute > 0) {
        _remainingSecond = 59;
        _remainingMinute--;
      } else if (_remainingHour > 0) {
        _remainingMinute = 59;
        _remainingHour--;
      }
      update();
    }
  }
}
