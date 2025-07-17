import 'package:flutter/material.dart';
import 'package:onboarding_form/ui/screens/step_breed_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(), // disable swipe
        children: const [StepBreedPage()],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
