import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  Future<void> _goNext() async {
    // TODO(backend): yaha check karenge ki user logged in hai ya onboarding
    // dekh chuka hai. Abhi hamesha onboarding pe jaa rahe hain.
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    context.go(Routes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: scheme.onPrimary,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(Icons.bolt_rounded, size: 56, color: scheme.primary),
            ),
            const SizedBox(height: 20),
            Text(
              'Plyzora',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: scheme.onPrimary,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Play. Win. Redeem.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onPrimary.withValues(alpha: 0.85),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
