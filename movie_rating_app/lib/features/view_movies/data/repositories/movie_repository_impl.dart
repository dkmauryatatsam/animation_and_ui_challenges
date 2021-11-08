import 'package:dartz/dartz.dart';
import 'package:movie_rating_app/core/error/exception.dart';

import 'package:movie_rating_app/core/error/failure.dart';
import 'package:movie_rating_app/features/view_movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_rating_app/features/view_movies/domain/entities/movie_entity.dart';
import 'package:movie_rating_app/features/view_movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    try {
      final movieData = await remoteDataSource.getMovies();
      print(movieData);
      final movies = movieData.map((movie) => movie.toDomain()).toList();
      return right(movies);
    } on ServerException {
      return left(ServerFailure());
    } on DataToDomainConversionException {
      return left(DataTODomainConversionFailure());
    }
  }
}
