import 'package:architect_example/data/clients/character_api_client.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';
import 'package:architect_example/models/heroes_&_monsters/barbarian.dart';
import 'package:architect_example/models/heroes_&_monsters/zombie.dart';

abstract class CharacterRepository {
  final CharacterApiClient characterApiClient;

  CharacterRepository({required this.characterApiClient});

  Future<Barbarian> getBarbarian();
  Future<Zombie> getZombie();
}