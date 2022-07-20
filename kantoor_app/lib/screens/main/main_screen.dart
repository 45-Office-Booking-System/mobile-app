import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/main/account/account_screen.dart';
import 'package:kantoor_app/screens/main/bottom_navbar.dart';
import 'package:kantoor_app/screens/main/home/home_screen.dart';
import 'package:kantoor_app/screens/main/order/order_screen.dart';
import 'package:kantoor_app/screens/main/wishlist/wishlist_screen.dart';
import 'package:kantoor_app/viewModels/screen_index_value.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = const [
    HomeScreen(),
    OrderScreen(),
    // WishlistScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenIndexProvider>(
      builder: (context, manager, _) {
        return Scaffold(
          body: screens[manager.index],
          bottomNavigationBar: BottomNavBar(
            selectedItemIcon: const [
              "assets/icons/home_active.png",
              "assets/icons/order_active.png",
              // "assets/icons/wishlist_active.png",
              "assets/icons/account_active.png",
            ],
            unselectedItemIcon: const [
              "assets/icons/home_inactive.png",
              "assets/icons/order_inactive.png",
              // "assets/icons/wishlist_inactive.png",
              "assets/icons/account_inactive.png",
            ],
            manager: manager,
          ),
        );
      },
    );
  }
}
