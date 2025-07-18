import 'package:flutter/material.dart';

import 'core/design_system/components/regular_filled_button.dart';
import 'core/design_system/spacings.dart';
import 'core/design_system/theme_data.dart';
import 'core/navigation/app_routes.dart';
import 'di/dependencies.dart';
import 'ui/screens/onboarding_screen.dart';

void main() {
  _setupDependencies();
  runApp(const MyApp());
}

Future<void> _setupDependencies() async {
  await initDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Form',
      theme: LightThemeVariation().lightAppThemeData,
      darkTheme: DarkThemeVariation().darkAppThemeData,
      home: const MyHomePage(),
      routes: {AppRoutes.onboarding: (context) => const OnboardingScreen()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Onboarding Form'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Let\'s get started!'),
              const SizedBox(height: x2),
              RegularFilledButton(onPressed: _onPressed, text: 'Start'),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() => Navigator.pushNamed(context, AppRoutes.onboarding);
}
