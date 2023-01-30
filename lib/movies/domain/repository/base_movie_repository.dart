import 'package:dartz/dartz.dart';
import 'package:moves/core/error/failure.dart';
import 'package:moves/movies/domain/entites/move.dart';

abstract class BaseMoveRepository {
  Future<Either<Failure, List<Movie>>> getNewPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getToRatedMovies();
}
