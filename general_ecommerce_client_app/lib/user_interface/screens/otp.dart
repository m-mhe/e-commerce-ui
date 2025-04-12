import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/state_holders/otp_timer_controller.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/sign_in.dart';
import 'package:general_ecommerce_client_app/user_interface/widgets/place_background_image.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utilities/light_theme_color.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceBackgroundImage(
        imageAddress: "asset/background_one.png",
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height / 4,
              right: 15,
              left: 15,
            ),
            child: Column(
              children: [
                Text(
                  "Verify Code",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: LightThemeColor.accentDarkOrange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 20),
                  child: Text(
                    "Please, enter the verification code we just sent to your email.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: LightThemeColor.accentDarkOrange.withAlpha(200),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 8,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
          
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: LightThemeColor.accentDarkOrange,
                    ),
                    enableActiveFill: true,
                    length: 4,
                    obscureText: true,
                    blinkWhenObscuring: true,
                    backgroundColor: Colors.transparent,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldWidth: MediaQuery.sizeOf(context).width / 10,
                      fieldHeight: (MediaQuery.sizeOf(context).width / 10) * 1.2,
                      borderRadius: BorderRadius.circular(3),
                      activeColor: LightThemeColor.accentOrange,
                      activeFillColor: LightThemeColor.mainWhite,
                      inactiveColor: LightThemeColor.accentOrange,
                      inactiveFillColor: LightThemeColor.mainWhite,
                      selectedColor: LightThemeColor.accentOrange,
                      selectedFillColor: LightThemeColor.mainWhite,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: ElevatedButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return SignIn();
                  }));}, child: Text("Verify",)),
                ),
                GetBuilder<OtpTimerController>(
                  builder: (controller) {
                    return Text("Code will expire in ${controller.remainingTime}s",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: LightThemeColor.accentDarkOrange.withAlpha(200),
                      ),);
                  }
                ),
                GetBuilder<OtpTimerController>(
                  builder: (controller) {
                    return TextButton(
                      onPressed: () {
                        if(controller.remainingTime == 0) controller.startTimer();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: controller.remainingTime == 0? LightThemeColor.accentDarkOrange: Colors.transparent,
                      ),
                      child: Text("Resend code"),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
