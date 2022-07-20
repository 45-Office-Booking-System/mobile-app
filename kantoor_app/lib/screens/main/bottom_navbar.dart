import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/screen_index_value.dart';

class BottomNavBar extends StatefulWidget {
  final List<String> selectedItemIcon;
  final List<String> unselectedItemIcon;
  final ScreenIndexProvider manager;

  const BottomNavBar({
    Key? key,
    required this.selectedItemIcon,
    required this.unselectedItemIcon,
    required this.manager,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<String> _selectedItemIcon = [];
  List<String> _unselectedItemIcon = [];

  @override
  void initState() {
    super.initState();
    _selectedItemIcon = widget.selectedItemIcon;
    _unselectedItemIcon = widget.unselectedItemIcon;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItems = [];

    for (int i = 0; i < 3; i++) {
      navBarItems.add(
        bottomNavBarItem(
          _selectedItemIcon[i],
          _unselectedItemIcon[i],
          i,
        ),
      );
    }

    return Container(
      decoration: const BoxDecoration(
        color: navbarColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navBarItems,
      ),
    );
  }

  Widget bottomNavBarItem(activeIcon, inactiveIcon, index) {
    final currentIndex = widget.manager.index;
    return GestureDetector(
      onTap: () {
        widget.manager.setCurrentIndex(index);
      },
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width / _selectedItemIcon.length,
        decoration: const BoxDecoration(
          color: navbarColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: currentIndex == index
              ? Image.asset(
                  activeIcon,
                  width: 22,
                  height: 22,
                )
              : Image.asset(
                  inactiveIcon,
                  width: 22,
                  height: 22,
                ),
        ),
      ),
    );
  }
}
