import 'package:flutter/material.dart';
import 'package:onboarding_form/core/design_system/components/regular_filled_button.dart';
import 'package:onboarding_form/ui/screens/step_breed_page.dart';

import 'core/design_system/theme_data.dart';
import 'di/dependencies.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Onboarding Form'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(), // disable swipe
                children: const [StepBreedPage()],
              ),
            ),
            RegularFilledButton(onPressed: () {}, child: Text('Continue')),
          ],
        ),
      ),
    );
  }
}
