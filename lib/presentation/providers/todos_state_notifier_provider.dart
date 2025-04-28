import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:uuid/uuid.dart';


const _uuid = Uuid();
final todosStateNotifierProvider = StateNotifierProvider.autoDispose<TodosNotifier,List<Todo> >((ref) {
return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier():super([
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),

  ]);

  void addTodo(){
    final newTodo = Todo(
      id: _uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null
    );

    state = [...state, newTodo];
  }

  void toggleTodo(String id){
    state = state.map((todo) {
      if(todo.id != id) return todo;
      if(todo.done) return todo.copyWith(completedAt: null);
      return todo.copyWith(completedAt: DateTime.now());
    }).toList();
  }
}

final filteredGuestProvider = Provider.autoDispose<List<Todo>>((ref) {
  final currentFile = ref.watch( todoCurrentFileProvider );
  final todos = ref.watch( todosStateNotifierProvider );

  switch(currentFile){
    case FilterType.all:
      return todos;
    case FilterType.completed:
      return todos.where((todo) => todo.done).toList();
    case FilterType.pending:
      return todos.where((todo) => !todo.done).toList();
  }
});