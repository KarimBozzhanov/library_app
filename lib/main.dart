import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:library_app/app.dart';
import 'package:library_app/di/di_locator.dart' as di_locator;
import 'package:library_app/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di_locator.initLocator();
  runApp(const MyApp());
}