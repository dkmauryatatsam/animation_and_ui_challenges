import 'package:movie_rating_app/core/error/exception.dart';
import 'package:movie_rating_app/features/view_movies/domain/entities/movie_entity.dart';

class MovieModel {
  String? title;
  String? overview;
  String? poster_path;
  double? vote_average;

  MovieModel(
    this.title,
    this.overview,
    this.poster_path,
    this.vote_average,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(json['title'], json['overview'], json['poster_path'],
        json['vote_average']);
  }

  MovieEntity toDomain() {
    checkIfNull(title);
    checkIfNull(overview);
    checkIfNull(poster_path);
    checkIfNull(vote_average);

    return MovieEntity(
      title: title!,
      overview: overview!,
      poster_path: poster_path!,
      vote_average: vote_average!,
    );
  }

  factory MovieModel.fromDomain(MovieEntity domain) {
    return MovieModel(
      domain.title,
      domain.overview,
      domain.poster_path,
      domain.vote_average,
    );
  }
}

checkIfNull(dynamic field) {
  if (field == null) {
    throw DataToDomainConversionException();
  }
}
