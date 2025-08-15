import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'startup_controller.dart';

class StartupView extends GetView<StartupController> {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: cs.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36),

            // Brand
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Crypt",
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: cs.onSurface,
                        letterSpacing: 1,
                      ),
                    ),
                    TextSpan(
                      text: "X",
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: cs.primary,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Illustration
            Center(
              child: Image.asset(
                'assets/images/cryptx.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            const Spacer(),

            // Copy + CTA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jump start your\ncrypto portfolio',
                    style: textTheme.headlineSmall?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Take your investment portfolio\nto next level',
                    style: textTheme.bodyMedium?.copyWith(
                      color: cs.onSurface.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: controller.onGetStarted,
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
