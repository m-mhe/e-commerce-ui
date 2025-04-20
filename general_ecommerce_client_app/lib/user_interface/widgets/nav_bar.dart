import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/state_holders/nav_bar_controller.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/cart_page.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/favorite_page.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/home_page.dart';
import 'package:general_ecommerce_client_app/user_interface/screens/profile_page.dart';
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
    return Scaffold(
      body: GetBuilder<NavBarController>(
        builder: (controller) {
          return screens[controller.currentNavIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int i) {
          Get.find<NavBarController>().navigateTo(navIndex: i);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
