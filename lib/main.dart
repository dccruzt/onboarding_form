import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'common/design_system/components/regular_filled_button.dart';
import 'common/design_system/spacings.dart';
import 'common/design_system/theme_data.dart';
import 'common/navigation/app_routes.dart';
import 'di/dependencies.dart';
import 'ui/screens/customer_details/customer_details_screen.dart';
import 'ui/screens/onboarding/onboarding_screen.dart';

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
      routes: {
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.customerDetails: (context) => const CustomerDetailsScreen(),
      },
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
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/dogs_variety.svg',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: x4),
              Text('Let\'s get started!', style: theme.textTheme.headlineSmall),
              const SizedBox(height: x2),
              const SizedBox(height: x4),
              RegularFilledButton(onPressed: _onPressed, text: 'Start'),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() => Navigator.pushNamed(context, AppRoutes.onboarding);
}
