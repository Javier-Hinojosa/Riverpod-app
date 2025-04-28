import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
import '../../domain/domain.dart';
import 'package:uuid/uuid.dart';
part 'todos_providers.g.dart';


const uuid= Uuid();

enum FilterType {
  all,
  completed,
  pending,
}

@Riverpod(keepAlive: false)
class TodoCurrentFile extends _$TodoCurrentFile {
  @override
  FilterType build() => FilterType.all;

  void changeCurrentFile(FilterType filter) {
    state = filter;
  }
}

@Riverpod(keepAlive: false)
class Todos extends _$Todos {
  @override
  List<Todo> build() => [
    Todo(
      id: uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null
    ),
    Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now()
    ),
    Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null
    )];


  void addTodo(String description) {
    final todo = Todo(
      id: uuid.v4(),
      description: description,
      completedAt: null
    );
    state = [...state, todo];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(completedAt: todo.done ? null : DateTime.now())
        else
          todo
    ];
  }
}


final filteredTodos = Provider.autoDispose<List<Todo>>((ref) {

  final selectFilter = ref.watch(todoCurrentFileProvider);
  final todos =  ref.watch(todosProvider);

  switch (selectFilter) {
    case FilterType.all:
      return todos;
    case FilterType.completed:
      return todos.where((element) => element.done).toList();
    case FilterType.pending:
      return todos.where((element) => !element.done).toList();
  }
});