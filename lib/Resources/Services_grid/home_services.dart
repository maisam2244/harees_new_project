import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Chat_App/Models/user_models.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/View/User_Pages/Doctor_visit/doctor_visit.dart';
import 'package:harees_new_project/View/User_Pages/Laboratory/laboratory.dart';
import 'package:harees_new_project/View/User_Pages/Nurse_visit/nurse_visit.dart';
import 'package:harees_new_project/View/User_Pages/Vitamin_IV_drips_and_fluids/Vitamin_IV_drips_and_fluids.dart';

class HomeServices extends StatelessWidget {
  final IconData serviceIcon;
  final String serviceName;
  final VoidCallback onPressed;

  const HomeServices({
    Key? key,
    required this.serviceIcon,
    required this.serviceName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                serviceIcon,
                size: 40.0,
                color: MyColors.blue,
              ),
              SizedBox(width: 10.0),
              Text(
                serviceName,
                style: TextStyle(
                  fontSize: 18.0,
                  color: MyColors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Home_Services extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const Home_Services(
      {Key? key, required this.userModel, required this.firebaseUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        InkWell(
          onTap: () {
            Get.to(() => Laboratory());
          },
          child: Center(
            child: Container(
              height: 120.0,
              width: 160.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 155, 218, 251),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Laboratory".tr,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        "assets/images/1.png",
                        height: 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => DoctorVisit());
          },
          child: Center(
            child: Container(
              height: 120.0,
              width: 160.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 155, 218, 251),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Doctor Visit".tr,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        "assets/images/2.png",
                        height: 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => NurseVisit());
          },
          child: Center(
            child: Container(
              height: 120.0,
              width: 160.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 155, 218, 251),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Nurse Visit".tr,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        "assets/images/3.png",
                        height: 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => Vitamin(
                  userModel: userModel,
                  firebaseUser: firebaseUser,
                ));
          },
          child: Center(
            child: Container(
              height: 120.0,
              width: 160.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 155, 218, 251),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Vitamin Drips".tr,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        "assets/images/4.png",
                        height: 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
