import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_transitions/1_basic/page.dart' as page1;
import 'package:smooth_transitions/2_custom_page_route/page.dart' as page2;
import 'package:smooth_transitions/3_build_in_transitions/page.dart' as page3;
import 'package:smooth_transitions/4_hero/page.dart' as page4;
import 'package:smooth_transitions/5_transitions_combination/page.dart'
    as page5;
import 'package:smooth_transitions/6_create_transition/page.dart' as page6;
import 'package:smooth_transitions/7_gesture_transition/page.dart' as page7;

import '1_basic/notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlatformNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FullscreenDialogNotifier(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth transitions in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform:
            Provider.of<PlatformNotifier>(context, listen: true).targetPlatform,
      ),
      home: const RootPage(title: 'Smooth transitions in Flutter'),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('1. Basic'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const page1.FirstPage(
                  title: '1. Basic',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('2. Custom Page Route'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const page2.FirstPage(
                  title: '2. Custom Page Route',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('3. Build in transitions'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const page3.FirstPage(
                  title: '3. Build in transitions',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('4. Hero'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const page4.FirstPage(
                  title: '4. Hero',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('5. Transition combinations'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const page5.FirstPage(
                  title: '5. Transition combinations',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('6. Create transition'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const page6.FirstPage(
                  title: '6. Create transition',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('7. Transition from gesture'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const page7.FirstPage(
                  title: '7. Transition from gesture',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
