// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String backdropPath;
  final List<int> genreIds;
  final String releaseDate;
  const Movie({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.genreIds,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      voteAverage,
      title,
      overview,
      backdropPath,
      genreIds,
      releaseDate
    ];
  }
}
