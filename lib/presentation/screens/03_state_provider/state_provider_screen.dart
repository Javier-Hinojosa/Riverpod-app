import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import '../../providers/providers.dart';


class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int counter = ref.watch(counterProvider);
    final bool darkMode = ref.watch(darkModeProvider);
    final String username = ref.watch(usernameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            IconButton(
              icon:  Visibility(
                  visible: !darkMode,
                  replacement: const Icon( Icons.dark_mode_outlined, size: 100 ),
                  child: const Icon( Icons.light_mode_outlined, size: 100 )),
              onPressed: () {
                ref.read(darkModeProvider.notifier).toggleDarkMode();
              }),
            Text(username, style: const TextStyle(fontSize: 25 )),
            TextButton.icon(
              icon: const Icon( Icons.add, size: 50,),
              label:  Text('$counter', style: const TextStyle(fontSize: 100)),
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
            ),
            
            const Spacer( flex: 2 ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon( Icons.refresh_rounded ),
        onPressed: () {
          ref.read(usernameProvider.notifier).changeName(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}