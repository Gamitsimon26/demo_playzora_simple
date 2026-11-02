import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Icon(
                  Icons.bolt_rounded,
                  size: 52,
                  color: scheme.onPrimary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Welcome to Plyzora',
                style: textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to start playing and collecting coins.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium
                    ?.copyWith(color: scheme.onSurfaceVariant),
              ),
              const Spacer(),
              FilledButton.icon(
                onPressed: () {
                  // TODO(backend): yaha Firebase Google Sign-In aayega.
                  // Abhi seedha Home pe bhej rahe hain (dummy login).
                  context.go(Routes.home);
                },
                icon: const Icon(Icons.login),
                label: const Text('Continue with Google'),
              ),
              const SizedBox(height: 16),
              Text(
                'By continuing you agree to our Terms of Service and Privacy Policy.',
                textAlign: TextAlign.center,
                style: textTheme.bodySmall
                    ?.copyWith(color: scheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
