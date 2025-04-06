import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final bool isMobile = screenWidth < 800;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTextContent(context, isMobile),
          const SizedBox(height: 24),
          Image.asset(
            'assets/figma.jpg',
            height: 200,
            fit: BoxFit.contain,
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: buildTextContent(context, isMobile)),
          const SizedBox(width: 40),
          Expanded(
            child: Image.asset(
              'assets/figma.jpg',
              height: 600,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextContent(BuildContext context, bool isMobile) {
    return Container(
        margin: const EdgeInsets.only(left: 100),
        child: Column(
            crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                "We Build Impactful \nDesign Solutions",
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 30 : 70,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "A modern design agency creating stunning visuals\nand user-friendly digital experiences.",
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment:
                isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      // Violet background
                      foregroundColor: Colors.white,
                      // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHovering = true),
                    onExit: (_) => setState(() => _isHovering = false),
                    child: AnimatedScale(
                      scale: _isHovering ? 1.05 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Watch Video",
                          style: TextStyle(
                            color: _isHovering
                                ? Colors.deepPurple
                                : Colors.deepPurpleAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ])

    );
  }

}
