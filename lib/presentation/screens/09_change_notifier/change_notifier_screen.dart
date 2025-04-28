import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';



class ChangeNotifierScreen extends ConsumerWidget {
  const ChangeNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () => ref.read(todosChangeNotifierProvider.notifier).addTodo(),
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todosChangeNotifier = ref.watch( todosChangeNotifierProvider );

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todosChangeNotifier.todos.length,
            itemBuilder: (context, index) {
              final todo = todosChangeNotifier.todos[index];
              return SwitchListTile(
                title:  Text(todo.description),
                value: todo.done,
                onChanged: ( value ) => ref.read( todosChangeNotifierProvider.notifier ).toggleTodo( todo.id ),
              );
            },
          ),
        )
      ],
    );
  }
}