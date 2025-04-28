import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';

const _uuid= Uuid();

final todosChangeNotifierProvider = ChangeNotifierProvider.autoDispose<TodosChangeNotifier>((ref) {
  return TodosChangeNotifier();
});

class TodosChangeNotifier extends ChangeNotifier {
  List<Todo> todos = [
    Todo(
      id: _uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null
    ),
    Todo(
        id: _uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now()
    ),
    Todo(
        id: _uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null
    )
  ];

  void addTodo() {
    final todo = Todo(
      id: _uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null
    );
    todos = [...todos, todo];
    notifyListeners();
  }

  void toggleTodo(String id){
    todos = todos.map((todo) {
      if(todo.id != id) return todo;
      if(todo.done) return todo.copyWith(completedAt: null);
      return todo.copyWith(completedAt: DateTime.now());
    }).toList();
    notifyListeners();
  }

}
