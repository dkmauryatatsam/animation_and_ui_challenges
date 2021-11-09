import 'package:get/instance_manager.dart';
import 'package:movie_rating_app/features/view_movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_rating_app/features/view_movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_rating_app/features/view_movies/domain/repositories/movie_repository.dart';
import 'package:movie_rating_app/features/view_movies/domain/usecases/get_movies.dart';
import 'package:movie_rating_app/features/view_movies/presentation/controller/movie_controller.dart';
import 'package:dio/dio.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController(getMovies: Get.find<GetMovies>()),
        fenix: false);
    Get.lazyPut(() => GetMovies(repository: Get.find<MovieRepository>()),
        fenix: false);
    Get.lazyPut<MovieRepository>(
        () => MovieRepositoryImpl(
            remoteDataSource: Get.find<MovieRemoteDataSource>()),
        fenix: false);
    Get.lazyPut<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(dio: Get.find<Dio>()),
        fenix: false);
    Get.lazyPut<Dio>(() => Dio(), fenix: false);
  }
}
