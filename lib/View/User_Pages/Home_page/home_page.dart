import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Chat_App/Models/user_models.dart';
import 'package:harees_new_project/Resources/AppBar/app_bar.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/Resources/Bottom_Navigation_Bar/bottom_nav.dart';
import 'package:harees_new_project/Resources/Services_grid/user_grid.dart';
import 'package:harees_new_project/View/User_Pages/Doctor_visit/doctor_visit.dart';
import 'package:harees_new_project/View/User_Pages/E-CLINIC/e_clinic.dart';
import 'package:harees_new_project/View/User_Pages/Laboratory/Lab_imp.dart';
import 'package:harees_new_project/View/User_Pages/Nurse_visit/nurse_visit.dart';
import 'package:harees_new_project/View/User_Pages/Vitamin_IV_drips_and_fluids/Vitamin_IV_drips_and_fluids.dart';
import 'package:harees_new_project/View/User_Pages/virtual_consultation/virtual_consultation.dart';

class HomePage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  HomePage({
    Key? key,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user_appointments =
      FirebaseFirestore.instance.collection("User_appointments").snapshots();

  final accepted_appointments =
      FirebaseFirestore.instance.collection("Accepted_appointments");

  final CollectionReference user_appointment_delete =
      FirebaseFirestore.instance.collection("User_appointments");
  final _auth = FirebaseAuth.instance;

  bool acceptAppointment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.PageBg,
      appBar: MyAppBar(
          firebaseUser: widget.firebaseUser, userModel: widget.userModel),
      // endDrawer: MyDrawer(
      //   ontap: () async{
      //       await GoogleSignIn().signOut();

      //       await FirebaseAuth.instance.signOut();

      //       _auth.signOut();

      //       Get.to(() => Splash_Screen());

      //   },
      //   userModel: widget.userModel,
      //   firebaseUser: widget.firebaseUser,
      // ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColors.PageBg,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      onTap: () {},
                      tileColor: MyColors.PageBg,
                      title: Text(
                        "We accept Bupa, Tawuniya, MEDGULF, Malath and AlRajhi Takaful insurance for medicine."
                            .tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      subtitle: GestureDetector(
                        onTap: () {
                          Get.to(() => AvailableProviders());
                        },
                        child: Text("Virtual Medical Service".tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  onTap: () {
                    Get.to(() => E_Clinics());
                  },
                  tileColor: Colors.white,
                  leading: Icon(Icons.videocam_rounded,
                      color: MyColors.blue, size: 40),
                  title: Text(
                    "Virtual Consultations".tr,
                    style: TextStyle(
                        color: MyColors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  subtitle: Text(
                    "We accept Bupa, Tawuniya, MEDGULF, Malath and AlRajhi Takaful insurance for telemedicine."
                        .tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: MyColors.PageBg,
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, color: Colors.green),
                          SizedBox(width: 5),
                          Text("Select Location".tr,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Colors.black),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Home Visit Services'.tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LabImp());
                        },
                        child: Container(
                          height: 120.0,
                          width: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 155, 218, 251),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text("Laboratory".tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Image.asset(
                                "assets/images/1.png",
                                height: 60,
                              ),
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => DoctorVisit());
                        },
                        child: Container(
                          height: 120.0,
                          width: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 155, 218, 251),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text("Doctor Visit".tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Image.asset(
                                "assets/images/2.png",
                                height: 60,
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 40,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => NurseVisit());
                        },
                        child: Container(
                          height: 120.0,
                          width: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 155, 218, 251),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text("Nurse Visit".tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Image.asset(
                                "assets/images/3.png",
                                height: 60,
                              ),
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Vitamin(
                                userModel: widget.userModel,
                                firebaseUser: widget.firebaseUser,
                              ));
                        },
                        child: Container(
                          height: 120.0,
                          width: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 155, 218, 251),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text("Vitamin Drips".tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Image.asset(
                                "assets/images/4.png",
                                height: 60,
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ]),
                  ]),
                  SizedBox(
                    height: 40,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'More Services:'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              UserServicesGrid(
                userModel: widget.userModel,
                firebaseUser: widget.firebaseUser,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pending appointments".tr,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: user_appointments,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Text("Loading");
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(
                              snapshot.data!.docs[index]['email'].toString(),
                              style: TextStyle(
                                  color: Colors.blue[700], fontSize: 16),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['address']
                                      .toString(),
                                  style: TextStyle(color: Colors.green[800]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data!.docs[index]["type"].toString(),
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              ],
                            ),
                            leading: Icon(
                              Icons.person,
                              color: Colors.blue[700],
                              size: 40,
                            ),
                            trailing: Icon(
                              Icons.medical_services,
                              size: 35,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        userModel: widget.userModel,
        firebaseUser: widget.firebaseUser,
      ),
    );
  }
}
