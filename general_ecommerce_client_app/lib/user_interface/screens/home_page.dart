import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/state_holders/flash_sale_categories_controller.dart';
import 'package:general_ecommerce_client_app/state_holders/flash_sale_timer_controller.dart';
import 'package:general_ecommerce_client_app/user_interface/utilities/light_theme_color.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentSliderIndex = ValueNotifier(0);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "CMZ-SHOP",
          style: TextStyle(
            color: LightThemeColor.accentTwoOrange,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: LightThemeColor.accentDarkOrange,
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: LightThemeColor.accentTwoOrange.withAlpha(70),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: LightThemeColor.accentTwoOrange,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: LightThemeColor.accentTwoOrange,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: LightThemeColor.accentTwoOrange,
                    size: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "asset/home_slider_image_$index.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    onPageChanged: (int index, _) {
                      currentSliderIndex.value = index;
                    },
                    aspectRatio: 16 / 8,
                    viewportFraction: 0.99,
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: currentSliderIndex,
                builder: (BuildContext context, int index, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor:
                                index == i
                                    ? LightThemeColor.accentTwoOrange
                                    : Colors.grey.withAlpha(100),
                          ),
                        ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: LightThemeColor.accentTwoOrange,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            color: LightThemeColor.accentTwoOrange,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  image: DecorationImage(
                                    image: AssetImage("asset/c$i.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Flash Sale",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: LightThemeColor.accentTwoOrange,
                      ),
                    ),
                    GetBuilder<FlashSaleTimerController>(
                      builder: (controller) {
                        return Row(
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).width / 11,
                              width: MediaQuery.sizeOf(context).width / 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: LightThemeColor.accentOrange.withAlpha(
                                  90,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.remainingHour.toString().padLeft(
                                    2,
                                    '0',
                                  ),
                                  style: TextStyle(
                                    color: LightThemeColor.accentDarkOrange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Text(
                                ":",
                                style: TextStyle(
                                  color: LightThemeColor.accentDarkOrange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.sizeOf(context).width / 11,
                              width: MediaQuery.sizeOf(context).width / 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: LightThemeColor.accentOrange.withAlpha(
                                  90,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.remainingMinute.toString().padLeft(
                                    2,
                                    '0',
                                  ),
                                  style: TextStyle(
                                    color: LightThemeColor.accentDarkOrange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Text(
                                ":",
                                style: TextStyle(
                                  color: LightThemeColor.accentDarkOrange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.sizeOf(context).width / 11,
                              width: MediaQuery.sizeOf(context).width / 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: LightThemeColor.accentOrange.withAlpha(
                                  90,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.remainingSecond.toString().padLeft(
                                    2,
                                    '0',
                                  ),
                                  style: TextStyle(
                                    color: LightThemeColor.accentDarkOrange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 35,
                  child: GetBuilder<FlashSaleCategoriesController>(
                    builder: (controller) {
                      return ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap: () {
                                controller.changeCategory(categoryNumber: 0);
                              },
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "All",
                                      style: TextStyle(
                                        color:
                                            controller.categoryNumber == 0
                                                ? Colors.white
                                                : LightThemeColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      controller.categoryNumber == 0
                                          ? LightThemeColor.accentTwoOrange
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                    color:
                                        controller.categoryNumber == 0
                                            ? LightThemeColor.accentTwoOrange
                                            : LightThemeColor.dark.withAlpha(
                                              70,
                                            ),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap:(){
                                controller.changeCategory(categoryNumber: 1);
                              },
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Trending",
                                      style: TextStyle(
                                        color:
                                        controller.categoryNumber == 1
                                            ? Colors.white
                                            : LightThemeColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  controller.categoryNumber == 1
                                      ? LightThemeColor.accentTwoOrange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                    color:
                                    controller.categoryNumber == 1
                                        ? LightThemeColor.accentTwoOrange
                                        : LightThemeColor.dark.withAlpha(
                                      70,
                                    ),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap:(){
                                controller.changeCategory(categoryNumber: 2);
                              },
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Bestseller",
                                      style: TextStyle(
                                        color:
                                        controller.categoryNumber == 2
                                            ? Colors.white
                                            : LightThemeColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  controller.categoryNumber == 2
                                      ? LightThemeColor.accentTwoOrange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                    color:
                                    controller.categoryNumber == 2
                                        ? LightThemeColor.accentTwoOrange
                                        : LightThemeColor.dark.withAlpha(
                                      70,
                                    ),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap:(){
                                controller.changeCategory(categoryNumber: 3);
                              },
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Popular",
                                      style: TextStyle(
                                        color:
                                        controller.categoryNumber == 3
                                            ? Colors.white
                                            : LightThemeColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  controller.categoryNumber == 3
                                      ? LightThemeColor.accentTwoOrange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                    color:
                                    controller.categoryNumber == 3
                                        ? LightThemeColor.accentTwoOrange
                                        : LightThemeColor.dark.withAlpha(
                                      70,
                                    ),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap:(){
                                controller.changeCategory(categoryNumber: 4);
                              },
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Newest",
                                      style: TextStyle(
                                        color:
                                        controller.categoryNumber == 4
                                            ? Colors.white
                                            : LightThemeColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  controller.categoryNumber == 4
                                      ? LightThemeColor.accentTwoOrange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                    color:
                                    controller.categoryNumber == 4
                                        ? LightThemeColor.accentTwoOrange
                                        : LightThemeColor.dark.withAlpha(
                                      70,
                                    ),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap:(){
                                controller.changeCategory(categoryNumber: 5);
                              },
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Men Collection",
                                      style: TextStyle(
                                        color:
                                        controller.categoryNumber == 5
                                            ? Colors.white
                                            : LightThemeColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  controller.categoryNumber == 5
                                      ? LightThemeColor.accentTwoOrange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                    color:
                                    controller.categoryNumber == 5
                                        ? LightThemeColor.accentTwoOrange
                                        : LightThemeColor.dark.withAlpha(
                                      70,
                                    ),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap:(){controller.changeCategory(categoryNumber: 6);},
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Women Collection",
                                      style: TextStyle(
                                        color:
                                        controller.categoryNumber == 6
                                            ? Colors.white
                                            : LightThemeColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  controller.categoryNumber == 6
                                      ? LightThemeColor.accentTwoOrange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                    color:
                                    controller.categoryNumber == 6
                                        ? LightThemeColor.accentTwoOrange
                                        : LightThemeColor.dark.withAlpha(
                                      70,
                                    ),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap:(){
                                controller.changeCategory(categoryNumber: 7);
                              },
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Kids Collection",
                                      style: TextStyle(
                                        color:
                                        controller.categoryNumber == 7
                                            ? Colors.white
                                            : LightThemeColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  controller.categoryNumber == 7
                                      ? LightThemeColor.accentTwoOrange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                    color:
                                    controller.categoryNumber == 7
                                        ? LightThemeColor.accentTwoOrange
                                        : LightThemeColor.dark.withAlpha(
                                      70,
                                    ),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
