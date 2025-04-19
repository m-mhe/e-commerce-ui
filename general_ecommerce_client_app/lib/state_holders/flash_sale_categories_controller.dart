import 'package:get/get.dart';

class FlashSaleCategoriesController extends GetxController {
  int _categoryNumber = 0;

  int get categoryNumber => _categoryNumber;

  void changeCategory({required int categoryNumber}) {
    _categoryNumber = categoryNumber;
    update();
  }
}
