import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier.dart';
import 'page.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        platform:
            Provider.of<PlatformNotifier>(context, listen: true).targetPlatform,
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(title: '1. Start with the basic'),
    );
  }
}
