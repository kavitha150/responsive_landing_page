import 'package:flutter/material.dart';
import 'package:landing_page/sections/contact_section.dart';
import 'package:landing_page/sections/features_section.dart';
import 'package:landing_page/sections/navbar.dart';
import 'package:landing_page/widgets/footer.dart';
import 'widgets/trusted_companies.dart';
import 'sections/hero_section.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Add the drawer here
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(title: Text('Home')),
            ListTile(title: Text('About')),
            ListTile(title: Text('Services')),
            ListTile(title: Text('Products')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Navbar(),
            HeroSection(),
            FeaturesSection(),
            TrustedCompaniesScroll(),
            ContactSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}






