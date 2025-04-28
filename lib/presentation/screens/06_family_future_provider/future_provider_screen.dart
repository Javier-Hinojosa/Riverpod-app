import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';


class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {

  int pokemonId=1;

  @override
  Widget build(BuildContext context) {
    final pokemonName = ref.watch( pokemonProvider(pokemonId) );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Future Provider')),
      body:  Center(
        child: pokemonName.when(
            data: (data) => Text(data),
            error: (_,__) => const Text("No se pudo cargar el nombre"),
            loading: ()=> const CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.refresh ),
        onPressed: () {
        pokemonId++;
          setState(() {});
        }),
    );
  }
}