import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import '../../providers/providers.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider + Providers'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () => ref.read( todosProvider.notifier ).addTodo( RandomGenerator.getRandomName() ),
      ),
    );
  }
}


class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentFile = ref.watch( todoCurrentFileProvider );
    //final todos = ref.watch( todosProvider );
    final todos= ref.watch( filteredTodos );

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const[
            ButtonSegment(value: FilterType.all, icon: Text('Todos')),
            ButtonSegment(value: FilterType.completed, icon: Text('Invitados')),
            ButtonSegment(value: FilterType.pending, icon: Text('No invitados')),
          ], 
          selected: <FilterType>{ currentFile },
          onSelectionChanged: (value) => ref.read( todoCurrentFileProvider.notifier ).changeCurrentFile(value.first),
        ),
        const SizedBox( height: 5 ),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return SwitchListTile(
                title:  Text(todo.description),
                value: todo.done,
                onChanged: ( value ) => ref.read( todosProvider.notifier ).toggleTodo( todo.id ),
              );
            },
          ),
        )
      ],
    );
  }
}