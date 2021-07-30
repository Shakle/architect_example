import 'package:architect_example/constants/enums.dart';

import '../../../constants/aliases.dart';

abstract class CharacterClient {
  Future<Json> fetchCharacter({required CharacterType characterType});
}