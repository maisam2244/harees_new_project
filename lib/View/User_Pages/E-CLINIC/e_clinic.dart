import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';

import 'providers_details.dart';

class E_Clinics extends StatefulWidget {
  E_Clinics({super.key});

  @override
  State<E_Clinics> createState() => _E_ClinicsState();
}

class _E_ClinicsState extends State<E_Clinics> {
  final user_appointments =
      FirebaseFirestore.instance.collection("Registered Providers").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              Get.back();
            });
          },
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'E-Clinics',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.greenColorauth),
              child: Center(
                child: Text(
                  "Select the consultant".tr,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: StreamBuilder<QuerySnapshot>(
                  stream: user_appointments,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Container(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Provider_Details(
                                        providerData: snapshot.data!.docs[index]
                                            .data() as Map<String, dynamic>,
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data!.docs[index]['fullname']
                                        .toString(),
                                    style: TextStyle(
                                      color: MyColors.logocolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]['experience']
                                            .toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        snapshot.data!.docs[index]['email']
                                            .toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      snapshot.data!.docs[index]['profilePic'],
                                      width: 80, // Adjust the width as needed
                                      height:
                                          120, // Adjust the height as needed
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 2.0,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
