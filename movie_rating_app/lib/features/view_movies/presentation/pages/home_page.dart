import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_rating_app/features/view_movies/presentation/controller/movie_controller.dart';

class HomePage extends GetView<MovieController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      switch (controller.pageState()) {
        case PageState.initial:
          return const Center(
            child: Icon(Icons.search),
          );
        case PageState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );

        case PageState.loaded:
          return ListView.builder(
            itemCount: controller.movies.length,
            itemBuilder: (_, index) {
              final movie = controller.movies[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          );
        case PageState.failed:
          return const Center(
              child: Icon(
            Icons.not_accessible,
          ));
      }
    }));
  }
}
