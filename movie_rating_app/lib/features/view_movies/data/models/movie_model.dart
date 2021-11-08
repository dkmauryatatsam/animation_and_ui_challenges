import 'package:movie_rating_app/core/error/exception.dart';
import 'package:movie_rating_app/features/view_movies/domain/entities/movie_entity.dart';

class MovieModel {
  String? title;
  String? overview;
  String? posterPath;
  String? voteAverage;

  MovieModel(
    this.title,
    this.overview,
    this.posterPath,
    this.voteAverage,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      json['title'],
      json['overview'],
      json['posterPath'],
      json['voteAverage'],
    );
  }

  MovieEntity toDomain() {
    checkIfNull(title);
    checkIfNull(overview);
    checkIfNull(posterPath);
    checkIfNull(voteAverage);
    return MovieEntity(
        title: title!,
        overview: overview!,
        posterPath: posterPath!,
        voteAverage: voteAverage!);
  }

  factory MovieModel.fromDomain(MovieEntity domain) {
    return MovieModel(
      domain.title,
      domain.overview,
      domain.posterPath,
      domain.voteAverage,
    );
  }
}

checkIfNull(dynamic field) {
  if (field == null) {
    throw DataToDomainConversionException();
  }
}
