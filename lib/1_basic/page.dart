import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_transitions/1_basic/navigator.dart';
import 'package:smooth_transitions/second_screen.dart';
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
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            title: const Text('Platform'),
            trailing: DropdownButton<TargetPlatform>(
              value: Theme.of(context).platform,
              items: TargetPlatform.values
                  .map(
                    (item) => DropdownMenuItem<TargetPlatform>(
                      value: item,
                      child: Text(item.name),
                    ),
                  )
                  .toList(),
              onChanged: (targetPlatform) {
                Provider.of<PlatformNotifier>(context, listen: false)
                    .update(targetPlatform);
              },
            ),
          ),
          ListTile(
            title: const Text('Fullscreen Dialog'),
            trailing: Switch.adaptive(
              value: Provider.of<FullscreenDialogNotifier>(context).isSelected,
              onChanged: (newValue) {
                Provider.of<FullscreenDialogNotifier>(context, listen: false)
                    .update(newValue);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              MyNavigator().push(
                context,
                toScreen: const SecondScreen(),
                fullscreenDialog: Provider.of<FullscreenDialogNotifier>(context,
                        listen: false)
                    .isSelected,
              );
            },
            child: const Text('Navigate'),
          )
        ],
      ),
    );
  }
}
