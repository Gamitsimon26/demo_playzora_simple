import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';

class _Slide {
  const _Slide(this.icon, this.title, this.subtitle);

  final IconData icon;
  final String title;
  final String subtitle;
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _slides = [
    _Slide(
      Icons.quiz_outlined,
      'Play Quizzes',
      'Answer fun questions every day and collect coins for each right answer.',
    ),
    _Slide(
      Icons.casino_outlined,
      'Spin, Scratch & Games',
      'Try the spin wheel, scratch cards and mini games for bonus coins.',
    ),
    _Slide(
      Icons.card_giftcard_outlined,
      'Redeem Your Coins',
      'Invite friends, complete daily tasks and redeem your coins for rewards.',
    ),
  ];

  final PageController _controller = PageController();
  int _page = 0;

  bool get _isLast => _page == _slides.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _finish() {
    // TODO(backend): yaha "onboarding dekh liya" flag save karenge.
    context.go(Routes.login);
  }

  void _next() {
    if (_isLast) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _finish,
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, i) {
                  final slide = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: scheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            slide.icon,
                            size: 80,
                            color: scheme.primary,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          slide.title,
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          slide.subtitle,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge
                              ?.copyWith(color: scheme.onSurfaceVariant),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (i) {
                final active = i == _page;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active ? scheme.primary : scheme.outlineVariant,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: FilledButton(
                onPressed: _next,
                child: Text(_isLast ? 'Get Started' : 'Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
