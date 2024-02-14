import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Chat_App/Models/user_models.dart';
import 'package:harees_new_project/Chat_App/Pages/Home.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/View/User_Pages/Home_page/home_page.dart';
import 'package:harees_new_project/View/User_Pages/Home_page/settings.dart';
import 'package:harees_new_project/View/User_services/User_appointments/User_appointments.dart';

class MyBottomNavBar extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  const MyBottomNavBar(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: MyColors.blue,
      unselectedItemColor: MyColors.blue,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 40),
          label: "Home".tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month, size: 40),
          label: "Appointments".tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, size: 40),
          label: "Chats".tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 40),
          label: "Settings".tr,
        ),
      ],
      onTap: (index) {
        setState(() {
          if (index == 0) {
            Get.to(() => HomePage(
                  userModel: widget.userModel,
                  firebaseUser: widget.firebaseUser,
                ));
          } else if (index == 1) {
            Get.to(() => MyAppointments(
                  userModel: widget.userModel,
                  firebaseUser: widget.firebaseUser,
                ));
          } else if (index == 2) {
            Get.to(() => Home(
                  userModel: widget.userModel,
                  firebaseUser: widget.firebaseUser,
                ));
          } else if (index == 3) {
            Get.to(() => SettingsPage(
                  userModel: widget.userModel,
                  firebaseUser: widget.firebaseUser,
                  targetUser: widget.userModel,
                ));
          }
        });
        // Handle item click based on index
      },
    );
  }
}
