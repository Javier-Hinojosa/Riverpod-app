import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'hello_world_provider.g.dart';

@riverpod
String helloWorldP(Ref ref){
  // This is a simple provider that returns a string
  return 'Hello World';
}