import 'dart:async';
import 'package:flutter/material.dart';

class TrustedCompaniesScroll extends StatefulWidget {
  const TrustedCompaniesScroll({Key? key}) : super(key: key);

  @override
  _TrustedCompaniesScrollState createState() => _TrustedCompaniesScrollState();
}

class _TrustedCompaniesScrollState extends State<TrustedCompaniesScroll> {
  final ScrollController _scrollController = ScrollController();
  late Timer _autoScrollTimer;

  final List<String> _companyLogos = [
    'assets/apple.png',
    'assets/meta.png',
    'assets/amazon.png',
    'assets/shopify.png',
    'assets/flutter.png',
    'assets/google.png',
    // Add more if needed
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.offset + 1);
        if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        }
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _autoScrollTimer.cancel(),
      onExit: (_) => _startAutoScroll(),
      child: Center(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: _companyLogos.length * 2, // Duplicate for seamless scroll
              itemBuilder: (context, index) {
                final logo = _companyLogos[index % _companyLogos.length];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Image.asset(
                    logo,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
