import 'package:architect_example/logic/services/abstracts/defence_service.dart';

class DefenceServiceImpl implements DefenceService {

  @override
  int getAttackPowerAfterDefence({
    required int attackValue,
    required int defenceValue,
  }) {
    attackValue -= defenceValue;

    return attackValue < 0 ? 0 : attackValue;
  }

}