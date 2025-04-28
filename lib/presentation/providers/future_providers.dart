import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';


final pokemonNameProvider = FutureProvider.autoDispose<String>((ref) async {
  final pokemonId = ref.watch( pokemonIdProvider );

  return await PokemonInformation.getPokemonName(pokemonId);
});

final pokemonIdProvider = StateProvider.autoDispose<int>((ref) => 1);


final pokemonProvider = FutureProvider.family<String,int>((ref,pokemonId) async {
  return await PokemonInformation.getPokemonName(pokemonId);
});
