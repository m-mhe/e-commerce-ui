import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/user_interface/utilities/light_theme_color.dart';

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
            color: LightThemeColor.accentOrange,
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
                    color: LightThemeColor.accentOrange.withAlpha(70),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: LightThemeColor.accentOrange,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: LightThemeColor.accentOrange,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: LightThemeColor.accentOrange,
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
                                    ? LightThemeColor.accentOrange
                                    : Colors.grey.withAlpha(100),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
