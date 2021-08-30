import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:visitorproject/loadScrn.dart';
import 'package:visitorproject/userlogin.dart';
import 'package:visitorproject/usermain.dart';

import 'MyApp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


