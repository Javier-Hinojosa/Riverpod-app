// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoCurrentFileHash() => r'716dcb8e81aea5eecc88642677adab02db03c29c';

/// See also [TodoCurrentFile].
@ProviderFor(TodoCurrentFile)
final todoCurrentFileProvider =
    AutoDisposeNotifierProvider<TodoCurrentFile, FilterType>.internal(
  TodoCurrentFile.new,
  name: r'todoCurrentFileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoCurrentFileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoCurrentFile = AutoDisposeNotifier<FilterType>;
String _$todosHash() => r'ee45f74cfbbb877b9f630e6b9cd5788ad37a9474';

/// See also [Todos].
@ProviderFor(Todos)
final todosProvider = AutoDisposeNotifierProvider<Todos, List<Todo>>.internal(
  Todos.new,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Todos = AutoDisposeNotifier<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
