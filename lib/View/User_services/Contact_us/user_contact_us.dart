import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/Resources/Button/mybutton.dart';

class UserContact extends StatelessWidget {
  UserContact({super.key});
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance.collection("User_contact_us");
  final message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        centerTitle: true,
        title: Text("Contact Us".tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
                controller: message,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your message'.tr,
                )),
          ),
          Center(
            child: RoundButton(
                text: "Submit".tr,
                onTap: () {
                  _fireStore
                      .doc(user!.email)
                      .set({"email": user.email, 'message': message.text});
                }),
          )
        ],
      ),
    );
  }
}
