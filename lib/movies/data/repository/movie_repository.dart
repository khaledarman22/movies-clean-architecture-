// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:moves/core/error/exception.dart';
import 'package:moves/core/error/failure.dart';
import 'package:moves/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:moves/movies/domain/entites/move.dart';
import 'package:moves/movies/domain/repository/base_movie_repository.dart';

class MoviesRepository extends BaseMoveRepository {
  final BaseMoveRemoteDataSource baseMoveRemoteDataSource;
  MoviesRepository({
    required this.baseMoveRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Movie>>> getNewPlaying() async {
    final result = await baseMoveRemoteDataSource.getNowPlayingMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(massage: failure.errorMassageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMoveRemoteDataSource.getPopularMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(massage: failure.errorMassageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getToRatedMovies() async {
    final result = await baseMoveRemoteDataSource.getTopRatedMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(massage: failure.errorMassageModel.statusMassage));
    }
  }
}
