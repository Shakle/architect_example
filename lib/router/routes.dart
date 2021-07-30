import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/data/clients/character_api_client.dart';
import 'package:architect_example/data/repositories/character_repository.dart';
import 'package:architect_example/logic/blocs/player_first/player_first_cubit.dart';
import 'package:architect_example/logic/blocs/player_second/player_second_bloc.dart';
import 'package:architect_example/logic/services/damage_service.dart';
import 'package:architect_example/logic/services/healing_service.dart';
import 'package:architect_example/ui/screens/fighting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String routeHome = '/';
const String routeEnemy = '/enemy';

Map<String, WidgetBuilder> routes(BuildContext context) {
  final PlayerSecondBloc _playerSecondBloc = PlayerSecondBloc();

  final PlayerFirstCubit _firstPlayerCubit = PlayerFirstCubit(
      playerSecondBloc: _playerSecondBloc,
      healingService: HealingServiceImpl(),
      damageService: DamageServiceImpl(),
      characterRepository: CharacterRepositoryImpl(
          characterApiClient: CharacterApiClient(),
      ),
  );

  return {
    routeHome: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<PlayerFirstCubit>.value(value: _firstPlayerCubit),
          BlocProvider<PlayerSecondBloc>.value(value: _playerSecondBloc),
        ],
        child: const ScreenFighting(characterType: CharacterType.barbarian),
    ),
    routeEnemy: (context) => const ScreenFighting(characterType: CharacterType.zombie),
  };
}