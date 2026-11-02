import 'package:flutter/material.dart';

import 'app/router.dart';
import 'app/theme.dart';

void main() {
  runApp(const PlyzoraApp());
}

class PlyzoraApp extends StatelessWidget {
  const PlyzoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Plyzora',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
