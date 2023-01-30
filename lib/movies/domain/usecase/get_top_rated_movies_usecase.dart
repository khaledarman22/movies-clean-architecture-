// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:moves/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moves/core/usecase/base_usecase.dart';
import 'package:moves/movies/domain/entites/move.dart';
import 'package:moves/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoveRepository baseMoveRepository;
  GetTopRatedMoviesUseCase({
    required this.baseMoveRepository,
  });
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoveRepository.getToRatedMovies();
  }
}
