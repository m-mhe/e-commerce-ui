import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/controller_bindings.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/sign_up.dart';
import 'package:general_ecommerce_client_app/user_interface/utilities/light_theme_color.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindings(),
      title: "General E-Commerce",
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: LightThemeColor.accentDarkOrange,
          ),
          filled: true,
          fillColor: LightThemeColor.mainWhite,
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
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: LightThemeColor.accentOrange,
            foregroundColor: LightThemeColor.mainLight,
            fixedSize: Size.fromWidth(double.maxFinite),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: LightThemeColor.accentTwoOrange,
          unselectedItemColor: LightThemeColor.accentTwoOrange,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: SignUp(),
    );
  }
}
