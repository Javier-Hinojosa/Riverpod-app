import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const _StreamView(),
    );
  }
}

class _StreamView extends ConsumerWidget {
  const _StreamView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInChat = ref.watch(userInChatProvider);

    if(!userInChat.hasValue){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: userInChat.value?.length,
      itemBuilder: (context, index) {
        final name= userInChat.value?[index];
        return ListTile(
          title: Text(name ?? ''),
          leading: const Icon(Icons.person),
          trailing: const Icon(Icons.check_circle),
        );
      });
  }
}