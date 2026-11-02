import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';

class _FeatureCard {
  const _FeatureCard(this.title, this.subtitle, this.icon, this.route);

  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // TODO(backend): coins balance baad me Firestore se aayega.
  static const int _dummyCoins = 1250;

  static const _features = [
    _FeatureCard('Quiz', 'Answer & earn', Icons.quiz_outlined, Routes.quiz),
    _FeatureCard(
        'Spin Wheel', 'Daily spins', Icons.casino_outlined, Routes.spin),
    _FeatureCard('Scratch Card', 'Scratch to win',
        Icons.confirmation_number_outlined, Routes.scratch),
    _FeatureCard('Mini Game', 'Play for coins',
        Icons.sports_esports_outlined, Routes.miniGame),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plyzora'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Chip(
              avatar: const Icon(Icons.monetization_on, size: 18),
              label: const Text('$_dummyCoins'),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Balance card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your balance',
                        style: textTheme.bodyMedium?.copyWith(
                          color: scheme.onPrimary.withValues(alpha: 0.85),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$_dummyCoins coins',
                        style: textTheme.headlineMedium?.copyWith(
                          color: scheme.onPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                FilledButton.tonal(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(0, 44),
                  ),
                  onPressed: () => context.go(Routes.wallet),
                  child: const Text('Redeem'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Earn coins',
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _features.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, i) {
              final f = _features[i];
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => context.push(f.route),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(f.icon, size: 36, color: scheme.primary),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              f.title,
                              style: textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              f.subtitle,
                              style: textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
