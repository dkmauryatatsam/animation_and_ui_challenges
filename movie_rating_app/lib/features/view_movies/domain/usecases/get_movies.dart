import 'package:dartz/dartz.dart';
import 'package:movie_rating_app/core/error/failure.dart';
import 'package:movie_rating_app/features/view_movies/domain/entities/movie_entity.dart';
import 'package:movie_rating_app/features/view_movies/domain/repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository repository;
  GetMovies({
    required this.repository,
  });

  Future<Either<Failure, List<MovieEntity>>> call() {
    return repository.getMovies();
  }
}
