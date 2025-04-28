import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'username.provider.g.dart';

@Riverpod(keepAlive: true)
class Username extends _$Username {
  @override
  String build() {
    return 'Javier Hinojosa 😀';
  }

  void changeName(String name) {
    state = name;
  }

}
