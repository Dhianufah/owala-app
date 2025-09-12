import 'package:flutter/material.dart';
import 'package:owala_app/views/onboarding/components/body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(), // Todo membuat class body yang mengisi komponen halaman onboarding 
    );
  }
}