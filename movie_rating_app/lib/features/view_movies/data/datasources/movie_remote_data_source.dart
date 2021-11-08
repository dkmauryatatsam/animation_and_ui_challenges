import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:movie_rating_app/core/error/exception.dart';

import 'package:movie_rating_app/features/view_movies/data/models/movie_model.dart';

const String url =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=6d58530d6f2607f7d63929b159b82662';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;
  MovieRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<List<MovieModel>> getMovies() async {
    try {
      final uri = Uri.parse(url);
      final responce = await client.get(uri);

      final jsonResponce = jsonDecode(responce.body);
      return jsonResponce['results']
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
