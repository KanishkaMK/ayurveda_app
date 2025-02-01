import 'package:ayurveda_app/controller/providers/patient_provider.dart';
import 'package:ayurveda_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
//  runApp(const MyApp());
 runApp(
    ChangeNotifierProvider(
      create: (_) => PatientProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
      
}

}

