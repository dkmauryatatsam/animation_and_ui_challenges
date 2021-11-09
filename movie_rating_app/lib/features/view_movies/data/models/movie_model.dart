import 'package:movie_rating_app/core/error/exception.dart';
import 'package:movie_rating_app/features/view_movies/domain/entities/movie_entity.dart';

class MovieModel {
  String? title;
  String? overview;

  MovieModel(
    this.title,
    this.overview,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      json['title'],
      json['overview'],
    );
  }

  MovieEntity toDomain() {
    checkIfNull(title);
    checkIfNull(overview);

    return MovieEntity(
      title: title!,
      overview: overview!,
    );
  }

  factory MovieModel.fromDomain(MovieEntity domain) {
    return MovieModel(
      domain.title,
      domain.overview,
    );
  }
}

checkIfNull(dynamic field) {
  if (field == null) {
    throw DataToDomainConversionException();
  }
}
