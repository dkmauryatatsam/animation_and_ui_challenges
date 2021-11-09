import 'package:dio/dio.dart';
import 'package:movie_rating_app/core/error/exception.dart';
import 'package:movie_rating_app/features/view_movies/data/models/movie_model.dart';

const String url =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=6d58530d6f2607f7d63929b159b82662';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;
  MovieRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<MovieModel>> getMovies() async {
    try {
      final responce = await dio.get(url);
      final jsonResponce = responce.data['results'] as List;

      return jsonResponce
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
