import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/sign_in.dart';
import 'package:general_ecommerce_client_app/user_interface/utilities/light_theme_color.dart';
import 'package:general_ecommerce_client_app/user_interface/widgets/place_background_image.dart';

import 'otp.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Let's get Started",
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
                    style: TextStyle(fontWeight: FontWeight.w500, color: LightThemeColor.accentDarkOrange),
                    decoration: InputDecoration(
                      hintText: "User name"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: TextField(
                    style: TextStyle(fontWeight: FontWeight.w500, color: LightThemeColor.accentDarkOrange),
                    decoration: InputDecoration(
                        hintText: "Email"
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: TextField(
                    style: TextStyle(fontWeight: FontWeight.w500, color: LightThemeColor.accentDarkOrange),
                    decoration: InputDecoration(
                        hintText: "Password"
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: TextField(
                    style: TextStyle(fontWeight: FontWeight.w500, color: LightThemeColor.accentDarkOrange),
                    decoration: InputDecoration(
                        hintText: "Rewrite password"
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return Otp();
                      }));
                    },
                    child: Text("Sign up"),
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
