import 'package:flutter/material.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/views/onboarding/onboarding_screen.dart';


void main() {
  runApp(OwalaApp());
}

class OwalaApp extends StatefulWidget {
  const OwalaApp({super.key});

  @override
  State<OwalaApp> createState() => _OwalaAppState();
}

class _OwalaAppState extends State<OwalaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Owala App",
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        visualDensity: VisualDensity.adaptivePlatformDensity,  // untuk mengatur kepadatan di setiap platform/ buat menyesuaikan responsif di setiap device
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodySmall: TextStyle(color: textColor),
        )
      ),
      home: OnboardingScreen(),
    );
  }
}