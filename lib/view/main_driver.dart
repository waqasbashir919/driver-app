import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kind/helper/helper.dart';
import 'package:kind/view/get_started.dart';
import 'package:kind/view/home.dart';
import 'package:kind/view/ride_history.dart';
import 'package:kind/view/wallet.dart';

class MainDriver extends StatefulWidget {
  const MainDriver({Key? key}) : super(key: key);

  @override
  State<MainDriver> createState() => _MainDriverState();
}

class _MainDriverState extends State<MainDriver> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screens = [Home(), Wallet(), RideHistory()];
    return SafeArea(
        child: Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedItemColor: helperClass().textColor,
          items: [
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(selectedIndex == 1
                      ? 'assets/bottomGreyHomeIcon.png'
                      : 'assets/bottomGreenHomeIcon.png'),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(selectedIndex == 2
                      ? 'assets/bottomGreyWalletIcon.png'
                      : 'assets/bottomGreenWalletIcon.png'),
                ),
                label: 'Wallet'),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(selectedIndex == 3
                      ? 'assets/bottomGreyRideIcon.png'
                      : 'assets/bottomGreenRideIcon.png'),
                ),
                label: 'Ride')
          ]),
    ));
  }
}
