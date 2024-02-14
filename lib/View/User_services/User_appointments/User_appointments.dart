// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Chat_App/Models/user_models.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/Resources/Bottom_Navigation_Bar/bottom_nav.dart';
import 'package:harees_new_project/Resources/Search_bar/search_bar.dart';

class MyAppointments extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  const MyAppointments({
    Key? key,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
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
    final user = _auth.currentUser;

    return Scaffold(
      backgroundColor: MyColors.PageBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.purple,
        centerTitle: true,
        title: Text(
          "Appointments",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            MySearchBar(),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: user_appointments,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong'.tr);
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Text("Loading".tr);
                }
                return Expanded(
                  child: ListView.builder(
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
                            tileColor: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        userModel: widget.userModel,
        firebaseUser: widget.firebaseUser,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   selectedItemColor: MyColors.blue,
      //   unselectedItemColor: Colors.grey.shade800,
      //   showUnselectedLabels: true,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Services",
      //     ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_month),
      //       label: "Appointments",
      //     ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: "Chats",
      //     ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: "My Profile",
      //     ),
      //   ],
      //   onTap: (index) {
      //     // Handle item click based on index
      //     if (index == 0) {

      //       Get.to(() => HomePage(
      //         userModel: widget.userModel,
      //         firebaseUser: widget.firebaseUser,
      //         ),
      //       );
      //     } else if (index == 1) {

      //       Get.to(() => MyAppointments(
      //         userModel: widget.userModel,
      //         firebaseUser: widget.firebaseUser,
      //         ),
      //       );
      //     }
      //     else if (index == 2) {

      //       Get.to(() => Home(
      //         userModel: widget.userModel,
      //         firebaseUser: widget.firebaseUser,
      //         ),
      //       );
      //     }
      //     else if (index == 3) {

      //       Get.to(() => ProfilePage());
      //     }
      //   },
      // )
    );
  }
}
