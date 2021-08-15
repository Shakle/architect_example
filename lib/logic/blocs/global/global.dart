import 'package:architect_example/data/clients/character_api_client.dart';
import 'package:architect_example/data/repositories/character_repository.dart';
import 'package:architect_example/logic/blocs/player_first/player_first_cubit.dart';
import 'package:architect_example/logic/blocs/player_second/player_second_bloc.dart';
import 'package:architect_example/logic/services/damage_service.dart';
import 'package:architect_example/logic/services/defence_service.dart';
import 'package:architect_example/logic/services/healing_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final PlayerFirstCubit _playerFirstCubit = PlayerFirstCubit(
  healingService: HealingServiceImpl(),
  damageService: DamageServiceImpl(defenceService: DefenceServiceImpl()),
  characterRepository: CharacterRepositoryImpl(
    characterApiClient: CharacterApiClient(),
  ),
);

final PlayerSecondBloc _playerSecondBloc = PlayerSecondBloc(
  healingService: HealingServiceImpl(),
  damageService: DamageServiceImpl(defenceService: DefenceServiceImpl()),
  characterRepository: CharacterRepositoryImpl(
    characterApiClient: CharacterApiClient(),
  ),
);

List<BlocProvider> globalBlocs = [
  BlocProvider<PlayerFirstCubit>.value(value: _playerFirstCubit),
  BlocProvider<PlayerSecondBloc>.value(value: _playerSecondBloc),
];