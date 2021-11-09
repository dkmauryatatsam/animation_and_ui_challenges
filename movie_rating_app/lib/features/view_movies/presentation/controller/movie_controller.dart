import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:movie_rating_app/features/view_movies/domain/entities/movie_entity.dart';

import 'package:movie_rating_app/features/view_movies/domain/usecases/get_movies.dart';

enum PageState { initial, loading, loaded, failed }

class MovieController extends GetxController {
  final GetMovies getMovies;
  MovieController({
    required this.getMovies,
  });
  RxList<MovieEntity> movies = RxList([]);
  var pageState = Rx<PageState>(PageState.initial);
  RxList<MovieEntity> get listMovie => movies;
  Future<void> fetchMovie() async {
    pageState(PageState.loading);
    final movieData = await getMovies();
    movieData.fold((l) => pageState(PageState.failed), (r) {
      movies.value = r;
      pageState(PageState.loaded);
    });
  }

  @override
  Future<void> onInit() async {
    await fetchMovie();
    super.onInit();
  }
}
