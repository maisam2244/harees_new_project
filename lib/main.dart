import 'package:file_picker/file_picker.dart' as FilePicker;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Chat_App/Models/firebase_helper.dart';
import 'package:harees_new_project/Chat_App/Models/user_models.dart';
import 'package:harees_new_project/View/Splash_Screen/splash_screen.dart';
import 'package:harees_new_project/ViewModel/Localization/localization.dart';

import 'package:uuid/uuid.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

var uuid = Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FilePicker.PlatformFile;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    // Logged In
    UserModel? thisUserModel =
        await FirebaseHelper.getUserModelById(currentUser.uid);
    if (thisUserModel != null) {
      runApp(MyApp(userModel: thisUserModel, firebaseUser: currentUser));
    } else {
      runApp(MyApp());
    }
  } else {
    // Not logged in
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  final UserModel? userModel;
  final User? firebaseUser;

  const MyApp({Key? key, this.userModel, this.firebaseUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splash_Screen(),
      debugShowCheckedModeBanner: false,
      locale: Locale("en", "US"),
      fallbackLocale: Locale("en", "US"),
      translations: Language(),
    );
  }
}
