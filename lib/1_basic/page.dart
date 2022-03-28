import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../second_screen.dart';
import 'main.dart';
import 'navigator.dart';
import 'notifier.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: TargetPlatform.values.length,
        itemBuilder: (context, index) {
          final item = TargetPlatform.values[index];
          return ListTile(
            title: Text(item.name),
            onTap: () {
              Provider.of<PlatformNotifier>(context, listen: false)
                  .update(item);
              MyNavigator().push(
                context,
                toScreen: const SecondScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
