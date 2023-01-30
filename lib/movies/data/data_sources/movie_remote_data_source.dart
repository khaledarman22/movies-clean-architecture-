import 'package:dio/dio.dart';
import 'package:moves/core/error/exception.dart';
import 'package:moves/core/network/api_constance.dart';
import 'package:moves/core/network/error_massege_model.dart';
import 'package:moves/movies/data/models/movies_model.dart';

abstract class BaseMoveRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
}

class MoveRemoteDataSource extends BaseMoveRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response =
        await Dio().get(ApiConstance.nowPlayingMoviesPath).then((value) {
      return value;
    }).catchError((onError) {
      // print(onError);
    });
    if (response.statusCode == 200) {
      return List.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response =
        await Dio().get(ApiConstance.popularMoviesPath).then((value) {
      return value;
    }).catchError((onError) {
      // print(onError);
    });
    if (response.statusCode == 200) {
      return List.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}
