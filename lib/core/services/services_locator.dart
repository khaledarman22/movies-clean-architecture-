import 'package:get_it/get_it.dart';
import 'package:moves/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:moves/movies/data/repository/movie_repository.dart';
import 'package:moves/movies/domain/repository/base_movie_repository.dart';
import 'package:moves/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:moves/movies/domain/usecase/get_populer_movies_usecase.dart';
import 'package:moves/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:moves/movies/presentation/controllers/cubit/move_cubit_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  // sl.registerFactory
  init() {
    sl.registerLazySingleton(
      () => MoveCubit(sl(), sl(), sl()),
    );
    // USE CASE
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUsesCase(baseMoveRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMoveRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(baseMoveRepository: sl()));
    // REPOSITORY
    sl.registerLazySingleton<BaseMoveRepository>(
        () => MoviesRepository(baseMoveRemoteDataSource: sl()));
    // DATA SOURCE
    sl.registerLazySingleton<BaseMoveRemoteDataSource>(
        () => MoveRemoteDataSource());
  }
}
