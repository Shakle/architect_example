import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/data/clients/character_api_client.dart';
import 'package:architect_example/data/repositories/abstracts/character_repository.dart';
import 'package:architect_example/models/heroes_&_monsters/barbarian.dart';
import 'package:architect_example/models/heroes_&_monsters/zombie.dart';
import '../../constants/aliases.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  final CharacterApiClient characterApiClient;

  CharacterRepositoryImpl({required this.characterApiClient});

  @override
  Future<Barbarian> getBarbarian() async {
    Json json = await characterApiClient.fetchCharacter(characterType: CharacterType.barbarian);
    return Barbarian.fromJson(json);
  }

  @override
  Future<Zombie> getZombie() async {
    Json json = await characterApiClient.fetchCharacter(characterType: CharacterType.zombie);
    return Zombie.fromJson(json);
  }

}