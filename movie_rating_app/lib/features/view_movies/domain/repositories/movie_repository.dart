import 'package:dartz/dartz.dart';
import 'package:movie_rating_app/core/error/failure.dart';
import 'package:movie_rating_app/features/view_movies/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}
