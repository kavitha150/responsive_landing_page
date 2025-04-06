import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: FeaturesSection()),
  ));
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Why Choose Us?",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Explore our key features that make us stand out",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              FeatureCard(
                topColor: Colors.deepPurple,
                title: "Fast Performance",
                description:
                "Optimized for speed and efficiency to ensure a seamless experience.",
              ),
              FeatureCard(
                topColor: Colors.green,
                title: "Secure Platform",
                description:
                "We prioritize data privacy with industry-grade security protocols.",
              ),
              FeatureCard(
                topColor: Colors.blue,
                title: "Modern Design",
                description:
                "Built with a clean and modern UI to impress your users.",
              ),
              FeatureCard(
                topColor: Colors.orange,
                title: "24/7 Support",
                description:
                "Always here to help you with anything, anytime.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatefulWidget {
  final String title;
  final String description;
  final Color topColor;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.topColor,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: _isHovering ? 1.05 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 260,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border(
              top: BorderSide(color: widget.topColor, width: 4),
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovering
                    ? widget.topColor.withOpacity(0.3)
                    : Colors.black12,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 4),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                widget.description,
                style: const TextStyle(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
