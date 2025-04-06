import 'package:flutter/material.dart';
import 'package:landing_page/sections/contact_section.dart';
import 'package:landing_page/sections/features_section.dart';
import 'package:landing_page/sections/navbar.dart';
import 'package:landing_page/sections/hero_section.dart';
import 'package:landing_page/widgets/footer.dart';
import 'package:landing_page/widgets/trusted_companies.dart';

void main() {
  runApp(const DesignAgencyApp());

}

class DesignAgencyApp extends StatelessWidget {
  const DesignAgencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Agency Landing Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:  [
              Navbar(),
              HeroSection(),


                      // Top hero or banner section
              FeaturesSection(),          // Features of the app
              TrustedCompaniesScroll(),   // Scrolling logos
              ContactSection(),           // Contact form / info
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
