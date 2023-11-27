import 'package:flutter/material.dart';
import '../utils/BankingBottomNavigationBar.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import 'package:get/get.dart';
import 'package:inway/controller/auth_controller.dart';
import 'BankingHome1.dart';
import 'BankingMenu.dart';
import 'BankingPayment.dart';
import 'BankingSaving.dart';
import 'BankingTransfer.dart';
import 'package:inway/utils/app_colors.dart';


class BankingDashboard extends StatefulWidget {
  static var tag = "/BankingDashboard";

  @override
  _BankingDashboardState createState() => _BankingDashboardState();
}

class _BankingDashboardState extends State<BankingDashboard> {

  AuthController authController = Get.find<AuthController>();


  @override
  void initState() {
    super.initState();

    authController.getUserInfo();

    selectedIndex = 0;
  }


  var selectedIndex = 0;
  var pages = [
    BankingHome1(),
    BankingTransfer(),
    BankingPayment(),
    BankingSaving(),
    BankingMenu(),
  ];



  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Banking_app_Background,
        bottomNavigationBar: BankingBottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Banking_greyColor.withOpacity(0.5),
          items: <BankingBottomNavigationBarItem>[
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Home, title: Text(Banking_lbl_Home)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Transfer, title: Text(Banking_lbl_Transfer)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Payment, title: Text(Banking_lbl_Payment)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Saving, title: Text(Banking_lbl_Saving)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Menu, title: Text(Banking_lbl_Menu)),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme: IconThemeData(
              color: Banking_greyColor.withOpacity(0.5), size: 28),
          selectedIconTheme: IconThemeData(color: AppColors.greenColor, size: 28),
          onTap: _onItemTapped,
          type: BankingBottomNavigationBarType.fixed,
        ),
        body: SafeArea(
          child: pages[selectedIndex],
        ),
      ),
    );
  }
}
