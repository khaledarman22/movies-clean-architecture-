import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves/core/error/failure.dart';
import 'package:moves/core/utils/enums/request_ste.dart';
import 'package:moves/movies/domain/entites/move.dart';
import 'package:moves/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:moves/movies/domain/usecase/get_populer_movies_usecase.dart';
import 'package:moves/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:moves/movies/presentation/controllers/states/move_cubit_state.dart';

class MoveCubit extends Cubit<MovieState> {
  final GetNowPlayingMoviesUsesCase getNowPlayingMoviesUsesCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoveCubit(this.getNowPlayingMoviesUsesCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MovieState());
  static MoveCubit get(context) => BlocProvider.of(context);

  Future<void> getNowPlayingMovies() async {
    Either<Failure, List<Movie>> responce = await getNowPlayingMoviesUsesCase();
    emit(state.copyWith(nowPlayingState: RequestState.loading));
    responce.fold(
        (error) => emit(state.copyWith(
            nowPlayingState: RequestState.error,
            popularMessage: error.massage)), (nowPlayingMovies) async {
      emit(state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: nowPlayingMovies));
    });
  }

  Future<void> getPopularMovies() async {
    Either<Failure, List<Movie>> responce = await getPopularMoviesUseCase();
    emit(state.copyWith(nowPlayingState: RequestState.loading));
    responce.fold(
        (error) => emit(state.copyWith(
            popularState: RequestState.error,
            popularMessage: error.massage)), (populerMoves) async {
      emit(state.copyWith(
          popularState: RequestState.loaded, popularMovies: populerMoves));
    });
  }

  Future<void> getTopRatedMovies() async {
    Either<Failure, List<Movie>> responce = await getTopRatedMoviesUseCase();
    emit(state.copyWith(topRatedState: RequestState.loading));
    responce.fold(
        (error) => emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: error.massage)), (topRatedMovies) async {
      // this.topRatedMovies = topRatedMovies;
      emit(state.copyWith(
          topRatedState: RequestState.loaded, topRatedMovies: topRatedMovies));
    });
  }
}
