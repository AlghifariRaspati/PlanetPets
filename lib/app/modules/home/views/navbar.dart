import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:planet_pets_app/app/modules/home/views/favorite.dart';
import 'package:planet_pets_app/app/modules/home/views/user.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'home_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeView(),
    const FavoriteView(),
    const UserView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
          curve: Curves.linear,
          duration: Duration(milliseconds: 300),
          borderRadius: Dimensions.radius20,
          dotIndicatorColor: AppColor.bgColor1,
          backgroundColor: AppColor.bgColor1,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: [
            DotNavigationBarItem(
                icon: Icon(Icons.home_filled),
                selectedColor: AppColor.mainColor,
                unselectedColor: AppColor.blankColor),
            DotNavigationBarItem(
                icon: Icon(Icons.favorite),
                selectedColor: AppColor.mainColor,
                unselectedColor: AppColor.blankColor),
            DotNavigationBarItem(
                icon: Icon(Icons.person),
                selectedColor: AppColor.mainColor,
                unselectedColor: AppColor.blankColor)
          ]),
    );
  }
}
