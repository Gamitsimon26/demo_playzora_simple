import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/login_screen.dart';
import '../features/home/home_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/placeholders.dart';
import '../features/splash/splash_screen.dart';
import 'shell.dart';

/// Saare route paths ek jagah, taaki screens me `context.go(Routes.home)` likh sako.
class Routes {
  Routes._();

  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';

  // Bottom navigation tabs
  static const home = '/home';
  static const tasks = '/tasks';
  static const wallet = '/wallet';
  static const referral = '/referral';
  static const profile = '/profile';

  // Feature screens (tab bar ke upar full screen khulti hain)
  static const quiz = '/quiz';
  static const spin = '/spin';
  static const scratch = '/scratch';
  static const miniGame = '/mini-game';

  // Sub screens
  static const coinsHistory = '/coins-history';
  static const redeemHistory = '/redeem-history';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),

    // Bottom navigation wale 5 tabs
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => const HomeScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.tasks,
            builder: (context, state) => const TasksScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.wallet,
            builder: (context, state) => const WalletScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.referral,
            builder: (context, state) => const ReferralScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ]),
      ],
    ),

    // Feature screens: bottom bar ke bina, poori screen
    GoRoute(
      path: Routes.quiz,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const QuizScreen(),
    ),
    GoRoute(
      path: Routes.spin,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SpinWheelScreen(),
    ),
    GoRoute(
      path: Routes.scratch,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const ScratchCardScreen(),
    ),
    GoRoute(
      path: Routes.miniGame,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const MiniGameScreen(),
    ),

    // Sub screens
    GoRoute(
      path: Routes.coinsHistory,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const CoinsHistoryScreen(),
    ),
    GoRoute(
      path: Routes.redeemHistory,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const RedeemHistoryScreen(),
    ),
  ],
);
