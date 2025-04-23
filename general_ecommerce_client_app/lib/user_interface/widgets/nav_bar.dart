import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/state_holders/nav_bar_controller.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/cart_page.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/favorite_page.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/home_page.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/profile_page.dart';
import 'package:general_ecommerce_client_app/user_interface/utilities/light_theme_color.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(),
      FavoritePage(),
      CartPage(),
      ProfilePage(),
    ];
    return GetBuilder<NavBarController>(
      builder: (controller) {
        return Scaffold(
          body: screens[controller.currentNavIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentNavIndex,

            onTap: (int i) {
              controller.navigateTo(navIndex: i);
            },
            items: [
              BottomNavigationBarItem(
                icon:
                    controller.currentNavIndex == 0
                        ? Icon(Icons.home)
                        : Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon:
                    controller.currentNavIndex == 1
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon:
                    controller.currentNavIndex == 2
                        ? Icon(Icons.shopping_cart)
                        : Icon(Icons.shopping_cart_outlined),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon:
                    controller.currentNavIndex == 3
                        ? Icon(Icons.person)
                        : Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
