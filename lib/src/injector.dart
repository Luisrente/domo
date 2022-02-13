import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/data_source_data.dart';
import 'data/repository/repository_data.dart';
import 'domain/repository/repository_domain.dart';
import 'domain/usecase/use_case_domain.dart';
import 'presentation/blocs/blocs.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
/*
.......##.......##.########..##........#######...######...######.
......##.......##..##.....##.##.......##.....##.##....##.##....##
.....##.......##...##.....##.##.......##.....##.##.......##......
....##.......##....########..##.......##.....##.##........######.
...##.......##.....##.....##.##.......##.....##.##.............##
..##.......##......##.....##.##.......##.....##.##....##.##....##
.##.......##.......########..########..#######...######...######.
*/

  locator.registerFactory(() => AuthBloc(
        firebaseAuth: locator(),
        authUseCaseDomnain: locator(),
        uSerCaseDomain: locator(),
        sharedPrefencesUseCase: locator(),
      ));
  locator.registerFactory(() => UserBloc(
        sharedPrefencesUseCase: locator(),
        uSerCaseDomain: locator(),
      ));

/*
.......##.......##.##.....##..######..########..######.....###.....######..########
......##.......##..##.....##.##....##.##.......##....##...##.##...##....##.##......
.....##.......##...##.....##.##.......##.......##........##...##..##.......##......
....##.......##....##.....##..######..######...##.......##.....##..######..######..
...##.......##.....##.....##.......##.##.......##.......#########.......##.##......
..##.......##......##.....##.##....##.##.......##....##.##.....##.##....##.##......
.##.......##........#######...######..########..######..##.....##..######..########
*/

  locator.registerLazySingleton(
      () => AuthUseCaseDomnain(authRepositoryDomain: locator()));
  locator.registerLazySingleton(() =>
      SharedPrefencesUseCase(sharedPreferencesRepositoryDomain: locator()));
  locator.registerLazySingleton(() =>
      UserUSerCaseDomain(userRepositoryDomain:  locator()));

/*
.......##.......##.########..########.########...#######...######..####.########..#######..########..##....##
......##.......##..##.....##.##.......##.....##.##.....##.##....##..##.....##....##.....##.##.....##..##..##.
.....##.......##...##.....##.##.......##.....##.##.....##.##........##.....##....##.....##.##.....##...####..
....##.......##....########..######...########..##.....##..######...##.....##....##.....##.########.....##...
...##.......##.....##...##...##.......##........##.....##.......##..##.....##....##.....##.##...##......##...
..##.......##......##....##..##.......##........##.....##.##....##..##.....##....##.....##.##....##.....##...
.##.......##.......##.....##.########.##.........#######...######..####....##.....#######..##.....##....##...
*/
  locator.registerLazySingleton<AuthRepositoryDomain>(
      () => AuthRepositoryImpl(authRemoteDataSource: locator()));
  locator.registerLazySingleton<SharedPreferencesRepositoryDomain>(() =>
      SharedPreferencesRepositoryImpl(
          sharedPreferencesLocalDataSource: locator()));
  locator.registerLazySingleton<UserRepositoryDomain>(() =>
      UserRepositoryImpl(
          userRemoteDataSource:  locator()));

/*
.......##.......##.########.....###....########....###.....######...#######..##.....##.########...######..########......
......##.......##..##.....##...##.##......##......##.##...##....##.##.....##.##.....##.##.....##.##....##.##............
.....##.......##...##.....##..##...##.....##.....##...##..##.......##.....##.##.....##.##.....##.##.......##............
....##.......##....##.....##.##.....##....##....##.....##..######..##.....##.##.....##.########..##.......######........
...##.......##.....##.....##.#########....##....#########.......##.##.....##.##.....##.##...##...##.......##............
..##.......##......##.....##.##.....##....##....##.....##.##....##.##.....##.##.....##.##....##..##....##.##............
.##.......##.......########..##.....##....##....##.....##..######...#######...#######..##.....##..######..########......
*/

  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(auth: locator()));
  locator.registerLazySingleton<SharedPreferencesLocalDataSource>(
      () => SharedPreferencesLocalDataSourceImpl(sharedPreferences: locator()));
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());

  /*
  .......##.......##.########.##.....##.########.########.########..##....##..#######.
  ......##.......##..##........##...##.....##....##.......##.....##.###...##.##.....##
  .....##.......##...##.........##.##......##....##.......##.....##.####..##.##.....##
  ....##.......##....######......###.......##....######...########..##.##.##.##.....##
  ...##.......##.....##.........##.##......##....##.......##...##...##..####.##.....##
  ..##.......##......##........##...##.....##....##.......##....##..##...###.##.....##
  .##.......##.......########.##.....##....##....########.##.....##.##....##..#######.
  */
  final sharedPreferences = await SharedPreferences.getInstance();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => auth);
  locator.registerLazySingleton(() => _messaging);
}
