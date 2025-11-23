import 'dart:async';
import 'package:flow_budget/pages/home_page.dart';
import 'package:flutter/material.dart';
 // kendi path’ine göre düzelt: ../pages/home_page.dart olabilir

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    // 1.5 saniye sonra HomePage'e geç
    Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // B) GRADIENT ARKA PLAN
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F172A), // koyu lacivert
              Color(0xFF22C55E), // yeşilimsi (FlowBudget hissi)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          // Basit scale + fade animasyonu
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.7, end: 1.0),
            duration: const Duration(milliseconds: 1200),
            builder: (context, value, child) {
              final opacity = ((value - 0.7) / 0.3).clamp(0.0, 1.0);
              return Opacity(
                opacity: opacity,
                child: Transform.scale(
                  scale: value,
                  child: child,
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // LOGO
                Image.asset(
                  'assets/image/icon.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 16),
                // UYGULAMA ADI
                const Text(
                  'FlowBudget',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Track your money flow',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}