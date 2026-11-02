import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/router.dart';

/// Abhi tak na bani screens ke liye simple placeholder.
/// Jab hum ek screen ka asli UI banayenge, to us screen ki class yaha se
/// hata ke apni alag file (features/<naam>/<naam>_screen.dart) me chali jaayegi.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
    this.children = const [],
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 72, color: scheme.primary),
              const SizedBox(height: 16),
              Text(
                title,
                style: textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                'Coming soon',
                style: textTheme.bodyMedium
                    ?.copyWith(color: scheme.onSurfaceVariant),
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

// ---- Bottom navigation tabs ----

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const PlaceholderScreen(title: 'Tasks', icon: Icons.checklist);
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: 'Wallet',
      icon: Icons.account_balance_wallet,
      children: [
        const SizedBox(height: 24),
        OutlinedButton(
          onPressed: () => context.push(Routes.coinsHistory),
          child: const Text('Coins History'),
        ),
        const SizedBox(height: 8),
        OutlinedButton(
          onPressed: () => context.push(Routes.redeemHistory),
          child: const Text('Redeem History'),
        ),
      ],
    );
  }
}

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const PlaceholderScreen(title: 'Referral', icon: Icons.group_add);
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const PlaceholderScreen(title: 'Profile', icon: Icons.person);
}

// ---- Feature screens ----

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const PlaceholderScreen(title: 'Quiz', icon: Icons.quiz);
}

class SpinWheelScreen extends StatelessWidget {
  const SpinWheelScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const PlaceholderScreen(title: 'Spin Wheel', icon: Icons.casino);
}

class ScratchCardScreen extends StatelessWidget {
  const ScratchCardScreen({super.key});

  @override
  Widget build(BuildContext context) => const PlaceholderScreen(
        title: 'Scratch Card',
        icon: Icons.confirmation_number,
      );
}

class MiniGameScreen extends StatelessWidget {
  const MiniGameScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const PlaceholderScreen(title: 'Mini Game', icon: Icons.sports_esports);
}

// ---- Sub screens ----

class CoinsHistoryScreen extends StatelessWidget {
  const CoinsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const PlaceholderScreen(title: 'Coins History', icon: Icons.history);
}

class RedeemHistoryScreen extends StatelessWidget {
  const RedeemHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) => const PlaceholderScreen(
        title: 'Redeem History',
        icon: Icons.receipt_long,
      );
}
