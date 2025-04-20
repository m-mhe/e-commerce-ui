import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/state_holders/flash_sale_timer_controller.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/home_page.dart';
import 'package:general_ecommerce_client_app/user_interface/widgets/place_background_image.dart';
import 'package:get/get.dart';
import '../utilities/light_theme_color.dart';
import '../widgets/nav_bar.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceBackgroundImage(
        imageAddress: "asset/background_one.png",
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height / 3,
              right: 15,
              left: 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: LightThemeColor.accentDarkOrange,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: LightThemeColor.accentDarkOrange,
                    ),
                    decoration: InputDecoration(hintText: "User name or email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: LightThemeColor.accentDarkOrange,
                    ),
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.find<FlashSaleTimerController>().startTimer(
                        remainingHour: 1,
                        remainingMinute: 2,
                        remainingSecond: 60,
                      );
                      Get.off(NavBar());
                    },
                    child: Text("Sign in"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
