import 'dart:convert';

import 'package:architect_example/constants/aliases.dart';
import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/data/clients/abstracts/character_client.dart';
import 'package:flutter/services.dart';

class CharacterApiClient implements CharacterClient {

  @override
  Future<Json> fetchCharacter({required CharacterType characterType}) async {
    String path = 'assets/jsons/';

    switch (characterType) {
      case CharacterType.barbarian:
        path += 'barbarian.json';
        break;
      case CharacterType.zombie:
        path += 'zombie.json';
        break;
    }

    final String response = await rootBundle.loadString(path);
    final Json _json = await json.decode(response);

    return Future.delayed(const Duration(seconds: 2), () => _json);
  }

}