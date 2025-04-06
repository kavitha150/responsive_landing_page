import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ✅ LOGO
          Image.asset(
            'assets/logo.jpg', // Make sure the image exists & is declared in pubspec.yaml
            height: isMobile ? 40 : 60,
            width: isMobile ? 120 : 200,
            fit: BoxFit.contain,
          ),

          // ✅ DESKTOP MENU ITEMS
          if (!isMobile)
            Row(
              children: [
                navItem("Home"),
                navItem("About"),
                navItem("Services"),
                navItem("Products"),
              ],
            ),

          // ✅ MOBILE ICON BUTTON
          if (isMobile)
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, size: 28, color: Colors.black),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
        ],
      ),
    );
  }

  Widget navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
