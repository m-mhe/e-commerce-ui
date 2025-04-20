import 'package:get/get.dart';

class NavBarController extends GetxController {
  int _currentNavIndex = 0;

  int get currentNavIndex => _currentNavIndex;

  void navigateTo({required int navIndex}) {
    _currentNavIndex = navIndex;
    update();
  }
}
